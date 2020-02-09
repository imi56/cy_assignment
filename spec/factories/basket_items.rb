FactoryBot.define do
  factory :basket_item do
    association :basket
    association :item
    quantity { 3 }
  end
end
