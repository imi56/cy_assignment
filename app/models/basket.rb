class Basket < ApplicationRecord
  has_many :basket_items

  accepts_nested_attributes_for :basket_items, reject_if: :all_blank, allow_destroy: true

  def self.update_or_create_by(args, attributes)
    obj = self.find_or_create_by(args)
    obj.update(attributes)
    obj
  end

  # For larger project, we must use serializers
  def user_json_response
    self.as_json(
        except: [:updated_at, :created_at],
        methods: [:discount_on_total],
        include: [
          basket_items: {
            except: [:updated_at, :created_at],
            methods: [:item_name, :item_price, :item_discount]
          }
        ]
      )
  end

  def discount_on_total
    Promotion.discount_on_total(basket_total)
  end

  private

  def basket_total
    basket_items.inject(0) {|sum, bi| sum + bi.quantity * (bi.item.price.to_f)}
  end

end
