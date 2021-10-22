class OrderPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postcode, :region_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    PurchaseRecord.create(postcode: postcode, region_id: region_id, city: city, street: street, building: building,
                          phone_number: phone_number, order_id: @order.id)
  end
end
