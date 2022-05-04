# テーブル設計

## users テーブル

｜ Colum               | Type    | Options                   |
｜ ------------------- | ------- | ------------------------- |
｜ nickname            | string  | null: false               |
｜ email               | string  | null: false, unique: true |
｜ password            | string  | null: false               |
｜ first_name          | string  | null: false               |
｜ last_name           | string  | null: false               |
｜ first_name_katakana | string  | null: false               |
｜ last_name_katakana  | string  | null: false               |
｜ birth_year          | integer | null: false               |
｜ birth_months        | integer | null: false               |
｜ birth_day           | integer | null: false               |

## itemsテーブル

｜ Colum              | Type       | Options                        |
｜ ------------------ | ---------- | ------------------------------ |
｜ name               | string     | null: false                    |
｜ explanation        | text       | null: false                    |
｜ category           | integer    | null: false                    |
｜ item_condition     | integer    | null: false                    |
｜ payer              | integer    | null: false                    |
｜ shipping_area      | integer    | null: false                    |
｜ waiting_days       | integer    | null: false                    |
｜ price              | integer    | null: false                    |
｜ user               | references | null: false, foreign_key: true |

## purchasesテーブル

｜ Colum              | Type       | Options                        |
｜ ------------------ | ---------- | ------------------------------ |
｜ item               | references | null: false, foreign_key: true |
｜ user               | references | null: false, foreign_key: true |

## destinationsテーブル

｜ Colum              | Type       | Options                        |
｜ ------------------ | ---------- | ------------------------------ |
｜ post_code          | string     | null: false                    |
｜ prefectures        | integer    | null: false                    |
｜ city               | string     | null: false                    |
｜ address            | string     | null: false                    |
｜ telephone_number   | string     | null: false                    |
｜ building           | string     | null: false                    |
｜ user               | references | null: false, foreign_key: true |
｜ purchase           | references | null: false, foreign_key: true |
