require 'rails_helper'

RSpec.describe Promotion, type: :model do
  describe "Discount on item calculation" do
    let(:item_b) { create(:item, name: 'B', price: 20) }
    let(:item_promotion_a) { create(:item_promotion) }
    let(:item_promotion_b) { create(:item_promotion, item: item_b) }

    context "when item A's quantity is less than 3" do
      it "should return 0 as discount" do
        expect(item_promotion_a.promotion.scan(2).to_f).to eq(0.0)
      end
    end

    context "when item A's quantity is more than 3" do
      it "should return proper discount" do
        quantity = 4
        promotion = item_promotion_a.promotion
        discount = (quantity / promotion.quantity.to_i) * promotion.value.to_f
        expect(promotion.scan(4).to_f).to eq(discount)
      end
    end

    context "when item B's quantity is less than 2" do
      it "should return 0 as discount" do
        expect(item_promotion_a.promotion.scan(1).to_f).to eq(0.0)
      end
    end

    context "when item B's quantity is more than 2" do
      it "should return proper discountt" do
        quantity = 4
        promotion = item_promotion_a.promotion
        discount = (quantity / promotion.quantity.to_i) * promotion.value.to_f
        expect(promotion.scan(4).to_f).to eq(discount)
      end
    end
  end

  describe "Discount on total calculation" do
    let(:promotion) { create(:total_promotion) }
    context "when total is less than threshold" do
      it "should return 0 as discount" do
        expect(Promotion.discount_on_total(149).to_f).to eq(0.0)
      end
    end

    context "when total is more than threshold" do
      it "should return proper discount" do
        discount = promotion.value.to_f
        expect(Promotion.discount_on_total(151).to_f).to eq(discount)
      end
    end
  end
end
