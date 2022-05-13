class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :city, :address, :telephone_number, :building, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefectures_id
    validates :city
    validates :address
    validates :telephone_number
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city, address: address,
                   telephone_number: telephone_number, building: building, order_id: order.id)
  end
end
