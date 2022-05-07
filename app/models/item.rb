class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :payer
  belongs_to :prefectures
  belongs_to :waiting_days
  belongs_to :user
  has_one_attached :image

  validates :category_id, :item_condition_id,:payer_id, :prefectures_id, :waiting_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :name, :explanation, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },format: { with: /\A[0-9]+\z/ }

end
