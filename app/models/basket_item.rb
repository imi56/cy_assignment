class BasketItem < ApplicationRecord
  before_validation :remove_item_with_zero_quantity

  belongs_to :basket
  belongs_to :item

  def item_name
    item.name
  end

  def item_price
    item.price.to_f
  end

  def item_discount
    promotion = item.promotion
    return 0 if promotion.blank? || !promotion.active?
    promotion.scan(self.quantity, item.price.to_f)
  end

  private

  def remove_item_with_zero_quantity
    self.destroy if quantity.to_i == 0
  end

end
