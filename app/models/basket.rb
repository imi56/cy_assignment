class Basket < ApplicationRecord
  has_many :basket_items

  accepts_nested_attributes_for :basket_items, reject_if: :all_blank, allow_destroy: true

  def self.update_or_create_by(args, attributes)
    obj = self.find_or_create_by(args)
    obj.update(attributes)
    obj
  end

end
