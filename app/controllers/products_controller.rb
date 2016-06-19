class ProductsController < ApplicationController
  def show
    @product = Product.where(slug: params[:slug]).first
    @order_item = current_order.order_items.new
    if @product.category.parent_id
      @parent_category = Category.where(id: @product.category.parent_id).take!
    end
  end
end
