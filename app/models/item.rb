class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true, content_type: :image, message: "can't be blank"
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: { with: /\A\d+\z/}, message: "is invalid. Input half-width characters"
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id , numericality: { other_than: 1, message: "can't be blank"}
  validates :scheduled_delivery_id , numericality: { other_than: 1, message: "can't be blank"}
end
