FactoryBot.define do
  factory :destination do
    postal_code         { "123-4567" }
    prefecture_id       { 1 }
    city                { Gimei.city.kanji }
    house_number        { Gimei.town.kanji }
    phone_number        { "09012345678" }
    association :order
  end
end
