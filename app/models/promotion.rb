class Promotion < ApplicationRecord
  has_one :item_promotion, dependent: :destroy #can be has_many if required
  has_one :item, through: :item_promotion
end
