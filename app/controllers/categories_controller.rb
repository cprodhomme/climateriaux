class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.where(slug: params[:slug]).first
    @products = Category.all_product @category
  end

end
