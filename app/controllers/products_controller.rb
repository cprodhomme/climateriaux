class ProductsController < ApplicationController
  def show
    @product = Product.where(slug: params[:slug])
    @images = ProductImage.where(product_id: @product)
    @order_item = current_order.order_items.new
  end
end
