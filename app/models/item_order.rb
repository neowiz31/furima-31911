class ItemOrder

  include ActiveModel::Model
  attr_accessor :image, :item_name, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price

# ここにバリデーションの処理を書く

  def save

  end
end