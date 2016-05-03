class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:slug])
    @order_item = current_order.order_items.new
  end
end
