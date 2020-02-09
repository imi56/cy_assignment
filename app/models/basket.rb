class Basket < ApplicationRecord
  has_many :basket_items

  accepts_nested_attributes_for :basket_items, reject_if: :all_blank, allow_destroy: true

end
