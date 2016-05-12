class SearchController < ApplicationController
  def search
    if params[:search].nil?
      @products = []
    else
      @products = Product.where("name LIKE ? ", "%#{params[:search]}%")
      @order_item = current_order.order_items.new
    end

  end
end
