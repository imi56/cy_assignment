class Promotion < ApplicationRecord
  store_accessor :rule, :quantity, :unit, :value, :threshost_amount

  has_one :item_promotion, dependent: :destroy #can be has_many if required
  has_one :item, through: :item_promotion

  AMOUNT = 'amount'
  PERCENTAGE = 'percentage'
  ALLOWED_UNITS = [AMOUNT, PERCENTAGE]

  def self.active_promotion_on_total
    @promotion_on_total ||= where(active: true).where(category: :total).first
  end

  # item_price is need when category is percentage
  def scan(item_quantity, item_price = 0)
    case category
    when 'item'
      discount_for(item_quantity, item_price)
    else
      raise "Invalid promotion category: #{category}"
    end
  end

  def self.discount_on_total(total_price)
    return 0 if active_promotion_on_total.nil?
    return active_promotion_on_total.value.to_f if amount_discount_available_on_total?(total_price)
    # calculate and return discount based on percentage if percentage_discount_available_on_total?(total_price)
    0 # return 0 if there is no discount
  end

  private


  # item_price is need when discount is given in percentage
  def discount_for(item_quantity, item_price)
    return (item_quantity.to_i / quantity.to_i).to_f * self.value.to_f if unit == AMOUNT
    # Percentage calculation logic here:  if unit == PERCENTAGE
    0 # return 0 if there is no discount
  end

  # returns true if promotion is based on amount and total amount qualifies for discount
  def self.amount_discount_available_on_total?(total_price)
    amount_discount? && total_price.to_f >= active_promotion_on_total.threshost_amount.to_f
  end

  # returns true if promotion is based on percentage and total amount qualifies for discount
  def self.percentage_discount_available_on_total?(total_price)
    percentage_discount? && total_price.to_f >= active_promotion_on_total.threshost_amount.to_f
  end

  # returns true if promotion is based on amount
  def self.amount_discount?
    active_promotion_on_total.unit == AMOUNT
  end

  # returns true if promotion is based on percentage
  def self.percentage_discount?
    active_promotion_on_total.unit == PERCENTAGE
  end


end
