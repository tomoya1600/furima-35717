class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :city_name
    validates :block_name
    validates :user_id
    validates :item_id
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end