class Admin::DashboardController < ApplicationController
  before_filter :verify_admin
  before_filter :number_orders

  layout 'admin'

  def index
    @number_products = Product.count
  end

  private
  def verify_admin
    if !current_user
      redirect_to new_user_session_path
    elsif current_user.role == "admin" || current_user.role == "merchant"
    else
      redirect_to root_url
    end
  end

  def number_orders
    @number_orders = Order.count
  end
end
