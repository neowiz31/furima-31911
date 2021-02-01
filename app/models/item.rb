class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :delivery_cost
  belongs_to  :delivery_time
  belongs_to  :item_category
  belongs_to  :item_quality
  belongs_to  :prefecture
  belongs_to  :user
  has_one_attached :image
  has_one :purchase_record

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :delivery_cost_id, numericality: { other_than: 1 }
    validates :delivery_time_id, numericality: { other_than: 1 }
    validates :item_category_id, numericality: { other_than: 1 }
    validates :item_quality_id,  numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
end
