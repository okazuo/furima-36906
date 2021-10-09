class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_number, :prefecture_id, :municipality, :lot_number, :building, :telephone, :order_id,
                :token, :price

  with_options presence: true do
    validates :postal_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :lot_number
    validates :telephone, format: { with: /\A\d{10,11}\z/ }, length: {minimum: 10}, numericality: {only_integer: true} 
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_number: postal_number, prefecture_id: prefecture_id, municipality: municipality,
                    lot_number: lot_number, building: building, telephone: telephone, order_id: order.id)
  end
end
