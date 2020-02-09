class BasketItem < ApplicationRecord
  before_validation :remove_item_with_zero_quantity
  belongs_to :basket
  belongs_to :item

  private

  def remove_item_with_zero_quantity
    self.destroy if quantity.to_i == 0
  end

end
