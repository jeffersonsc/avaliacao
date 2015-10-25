require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

	test "Acesso a pagina index" do
		get :index
		assert_response :success
	end

end
