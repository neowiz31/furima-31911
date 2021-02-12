class ItemOrder

  include ActiveModel::Model
  attr_accessor :image, :item_name, :nickname, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id

# ここにバリデーションの処理を書く

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_number: phone_number, order_id: order.id)
 

  end
end