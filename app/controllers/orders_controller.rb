class OrdersController < ApplicationController
  def index
  	@orders = Order.paginate(:page => params[:page], :per_page => 30)
  	@total = [0.0, 0]
  	Order.all.map{ |order| @total[0] += (order.amount.to_f * order.unit_price.to_f); @total[1] += 1 }
  	@total_customers = Customer.count
  	@total_products = Product.count
  	@total_providers = Provider.count
  end
end
