require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "teste de verificacao de salvar" do
	  order = Order.new
	  assert_not order.save
	end
end
