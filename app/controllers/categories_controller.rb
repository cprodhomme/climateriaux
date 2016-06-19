class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.where(slug: params[:slug]).first
    @products = Category.all_product @category
    if @category.parent_id
      @parent_category = Category.where(id: @category.parent_id).take!
    end
  end

end
