class OrderAddres
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :city, :addres, :telephone_number, :building, :order_id, :user_id, :item_id

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end