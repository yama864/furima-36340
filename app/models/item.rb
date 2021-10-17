class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :delivery_fee, :shipping_area, :ship_time

  validates :product_name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :ship_time_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than_or_equal_to: 300,
                                                    less_than_or_equal_to: 9_999_999 }
end
