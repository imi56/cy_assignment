class ItemsController < ApplicationController
  def index
    limit = params[:limit].presence || 10
    offset = params[:offset].presence || 0
    items = Item.limit(limit).offset(offset)
    render_success(items)
  end
end
