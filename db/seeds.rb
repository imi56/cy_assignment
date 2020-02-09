# create data

Item.insert_all!([
  { name: "A", price: 30 },
  { name: "B", price: 20 },
  { name: "C", price: 50 },
  { name: "D", price: 15 },
])

# if seed date is already there in anyone's database, we need a rake task to fix the data
Promotion.insert_all!([
  { category: "item", rule: { quantity: 3, unit: Promotion::AMOUNT, value: 15 }, active: true },
  { category: "item", rule: { quantity: 2, unit: Promotion::AMOUNT, value: 5 }, active: true },
  { category: "item", rule: { quantity: 3, unit: Promotion::PERCENTAGE, value: 10 }, active: false },
  { category: "total", rule: { threshost_amount: 150, unit: Promotion::AMOUNT, value: 20 }, active: true },
  { category: "total", rule: { threshost_amount: 150, unit: Promotion::PERCENTAGE, value: 5 }, active: false },
])

ItemPromotion.insert_all!([
  { item_id: 1, promotion_id: 1 },
  { item_id: 2, promotion_id: 2 }
])