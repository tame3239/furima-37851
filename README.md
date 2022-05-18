# テーブル設計

## usersテーブル

｜ Colum               | Type     | Options                   |
｜ ------------------- | -------- | ------------------------- |
｜ nickname            | string   | null: false               |
｜ email               | string   | null: false, unique: true |
｜ encrypted_password  | string   | null: false               |
｜ first_name          | string   | null: false               |
｜ last_name           | string   | null: false               |
｜ first_name_katakana | string   | null: false               |
｜ last_name_katakana  | string   | null: false               |
｜ birthday            | date     | null: false               |

## Associations
＊has_many :items
＊has_many :orders
＊has_many :comments

## itemsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| payer_id           | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| waiting_days_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Associations
*belongs_to :user
*has_one :order
*has_many :comments

## ordersテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## Associations
*belongs_to :user
*belongs_to :item
*has_one :address

## addressesテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| telephone_number   | string     | null: false                    |
| building           | string     |                                |
| oder               | references | null: false, foreign_key: true |

## Associations
*belongs_to :order

## commentsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Associations
*belongs_to :user
*belongs_to :item