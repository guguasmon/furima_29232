FactoryBot.define do
  factory :order do
    token                { 'abc123' }
    association :user
    association :item
  end
end
