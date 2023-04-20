class PayFormPurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" }, length: { in: 10..11, message: "is too short" }
    validates :user_id
    validates :item_id
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      purchases = PayPurchase.create(item_id: item_id, user_id: user_id)
      PayForm.create(postal_code: postal_code, city: city, addresses: addresses, building: building, phone_number: phone_number, pay_purchase_id: purchases.id, prefecture_id: prefecture_id)
    end
  end