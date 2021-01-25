class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :delivery_cost
  belongs_to  :delivery_time
  belongs_to  :item_category
  belongs_to  :item_quality
  belongs_to  :prefecture
  belongs_to  :user
  has_one_attached :image


  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :image
    validates :price
    validates :delivery_cost_id, numericality: { other_than: 1 } 
    validates :delivery_time_id, numericality: { other_than: 1 } 
    validates :item_category_id, numericality: { other_than: 1 } 
    validates :item_quality_id,  numericality: { other_than: 1 } 
    validates :prefecture_id,   numericality: { other_than: 1 } 
  end
end
