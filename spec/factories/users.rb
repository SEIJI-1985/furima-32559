FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(max_length: 6) }
    password_confirmation { password }
    family_name           { '尾越' }
    first_name            { '聖次' }
    family_name_kana      { 'オゴシ' }
    first_name_kana       { 'セイジ' }
    birthday              { '1900-01-01' }
  end
end
