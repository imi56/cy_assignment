class BasketsController < ApplicationController

  def create
    basket = Basket.update_or_create_by({id: create_params[:id]}, create_params)
    render_success(basket)
  end

  private

  def create_params
    params.require(:basket).permit(
      :id, basket_items_attributes: [:id, :item_id, :quantity]
    )
  end

end
