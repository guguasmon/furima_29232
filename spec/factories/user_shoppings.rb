FactoryBot.define do
  factory :user_shopping do
    postal_code         { '123-4567' }
    prefecture_id       { 1 }
    city                { Gimei.city.kanji }
    house_number        { Gimei.town.kanji }
    phone_number        { '09012345678' }
    token { 'abc123' }
    item_id       { 1 }
    user_id       { 1 }
  end
end
