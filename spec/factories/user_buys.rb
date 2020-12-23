FactoryBot.define do
  factory :user_buy do
    postal_code       {'455-9999'}
    prefecture_id     {'2'}
    city              {'名古屋'}
    house_number      {'111'}
    building          {'あああ'}
    phone_number      {'09012345678'}
    user_id           {'1'}
    item_id           {'1'}
  end
end
