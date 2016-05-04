class CategoriesController < ApplicationController

  def index
  end

  def show
    category = Category.where(slug: params[:slug])
    @products = Product.where(category: category)
  end

end
