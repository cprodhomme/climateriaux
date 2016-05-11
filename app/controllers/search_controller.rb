class SearchController < ApplicationController
  def search
    if params[:search].nil?
      @products = []
    else
      puts 'reussi'
      @products = Product.where("name LIKE ? ", "%#{params[:search]}%")  
      p @products
    end

  end
end
