class Item < ApplicationRecord
  has_one :item_promotion, dependent: :destroy
  has_one :promotion, through: :item_promotion
end
