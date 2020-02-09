# create data

Item.insert_all!([
  { name: "A", price: "30" },
  { name: "B", price: "20" },
  { name: "C", price: "50" },
  { name: "D", price: "50" },
])

Promotion.insert_all!([
  {type: "item_amount", rule: {quantity: 3, unit: "amount", value: 15}, active: true},
  {type: "item_amount", rule: {quantity: 2, unit: "amount", value: 5}, active: true},
  {type: "total_amount", rule: {threshost_amount: 150, unit: "amount", value: 20}, active: true},
  {type: "item_percentage", rule: {quantity: 3, unit: "percentage", value: 10}, active: false},
])

ItemPromotion.insert_all!([
  {item_id: 1, promotion_id: 1},
  {item_id: 2, promotion_id: 2}
])