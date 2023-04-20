class PayForm < ApplicationRecord
  belongs_to :pay_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  
end
