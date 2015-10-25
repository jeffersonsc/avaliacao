class OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	@total = 0.0
  end
end
