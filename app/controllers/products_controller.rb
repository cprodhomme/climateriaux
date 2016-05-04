class ProductsController < ApplicationController
  def show
    @product = Product.where(slug: params[:slug])
    @order_item = current_order.order_items.new
  end
end
