class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name         , null: false
      t.text       :item_info         , null: false
      t.integer    :item_category_id  , null: false
      t.integer    :item_quality_id   , null: false
      t.integer    :delivery_cost_id  , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :delivery_time_id  , null: false
      t.integer    :price             , null: false
      t.references :user_id           , foreign_key: true
      t.timestamps
    end
  end
end
