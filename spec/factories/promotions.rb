FactoryBot.define do
  factory :promotion do
    category { 'item' }
    active { true }
    rule {{ quantity: 3, unit: Promotion::AMOUNT, value: 15 }}

    factory :total_promotion do
      category { 'total' }
      rule {{ threshost_amount: 150, unit: Promotion::AMOUNT, value: 20 }}
    end

  end
end
