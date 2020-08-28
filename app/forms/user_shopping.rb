class UserShopping

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Include not hyphen(-)' }
  end

  def save
    order = Order.new(item_id: item_id, user_id: user_id)
    destination = Destination.new(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id )
    if destination.save
      order.save
    end
  end
end