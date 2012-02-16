require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
    @order2 = orders(:two)
    @order3 = orders(:three)
    @order4 = orders(:four)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @order.attributes
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order.to_param
    assert_response :success
  end
  
  test "sucessful auth" do
    get :show, id: @order.to_param   
    assert_equal("Successfully authorized an amount of $150.00 to the credit card XXXX-XXXX-XXXX-4242",assigns(:post))
    assert_template("orders/show","layouts/application")  
  end
  test "invalid creditcard number" do
    get :show, id: @order2.to_param
    assert_template("orders/error1","layouts/application")
  end
  test "invalid expdate" do
    get :show, id: @order3.to_param
    assert_template("orders/error1","layouts/application")
  end
  test "unsucessful transaction invalid amount" do
    get :show, id: @order4.to_param
    assert_match(/Error validating xml data against.*?/,assigns(:message))
    assert_template("orders/error2","layouts/application")
  end
  test "should get edit" do
    get :edit, id: @order.to_param
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order.to_param, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order.to_param
    end

    assert_redirected_to orders_path
  end
end
