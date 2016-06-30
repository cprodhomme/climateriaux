class CartsController < ApplicationController
  def show
    @order = current_order
    @order_items = @order.order_items
    @total = 10.50
    @order_items.each do |i|
      @total += i.total_price
    end
  end
end
