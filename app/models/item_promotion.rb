class ItemPromotion < ApplicationRecord
  belongs_to :item
  belongs_to :promotion
end
