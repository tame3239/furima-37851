class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :payer
  belongs_to :prefectures
  belongs_to :waiting_days
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :comments

  validates :category_id, :item_condition_id, :payer_id, :prefectures_id, :waiting_days_id,
            numericality: { other_than: 1, message: "を選択してください" }
  validates :name, :explanation, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message:"300以上、9999999以下の半角数字を入力してください" }

end
