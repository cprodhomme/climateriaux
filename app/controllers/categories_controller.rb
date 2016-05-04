class CategoriesController < ApplicationController

  def index
  end

  def show
    category = Category.where(slug: params[:slug])
    @products = Product.where(category_id: category)
    @order_item = current_order.order_items.new
  end

end
