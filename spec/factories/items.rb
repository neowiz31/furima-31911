FactoryBot.define do
  factory :item do
    item_name          { 'テスト' }
    item_info          { '商品情報' }
    price              { 300 }
    delivery_cost_id   { 2 }
    delivery_time_id   { 2 }
    item_category_id   { 2 }
    item_quality_id    { 2 }
    prefecture_id      { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-intro05.png'), filename: 'furima-intro05.png')
    end
  end
end
