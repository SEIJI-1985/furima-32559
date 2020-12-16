FactoryBot.define do
  factory :item do
    title              {'ああああああ'}
    price              {'1000'}
    category_id        {'2'}
    condition_id       {'2'}
    shipping_id        {'2'}
    send_out_id        {'2'}
    community_id       {'2'}
    explanation        {'いいいいいい'}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
