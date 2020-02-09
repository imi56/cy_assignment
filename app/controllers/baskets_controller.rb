class BasketsController < ApplicationController
  before_action :find_basket, only: :index

  def index
    render_success(@basket.user_json_response)
  end

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

  def find_basket
    basket_id = params[:basket_id]
    @basket = Basket.includes(:basket_items).find_by(id: basket_id)
    render_error(["No such basket exists"], :not_found) if @basket.nil?
  end
end
