FactoryBot.define do
  factory :item_order do
    postal_code          {'000-0000'}
    prefecture_id        {2}
    city                 {'渋谷区'}
    house_number         {'渋谷町6-10'}
    phone_number         {'08012345678'}
    item_id              {1}
    user_id              {1}
    token                {0}
  end
end
