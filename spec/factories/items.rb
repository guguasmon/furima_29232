FactoryBot.define do
  factory :item do
    name                { Faker::Food.dish }
    text                { Faker::Food.description }
    category_id         { 1 }
    state_id            { 1 }
    delivery_type_id    { 1 }
    prefecture_id       { 1 }
    duration_id         { 1 }
    price               { 1000 }
    association :user
  end
end
