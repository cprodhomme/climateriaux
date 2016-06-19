class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.where(slug: params[:slug]).first
    @products = Category.all_product @category 
    @order_item = current_order.order_items.new
  end

end
