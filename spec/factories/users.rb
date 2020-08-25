FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    first_name            { 'あア阿' }
    last_name             { 'いイ胃' }
    first_name_kana       { Gimei.first.katakana }
    last_name_kana        { Gimei.last.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
