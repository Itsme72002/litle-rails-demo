require 'test_helper'

class VoidsControllerTest < ActionController::TestCase
  setup do
    @void = voids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create void" do
    assert_difference('Void.count') do
      post :create, void: @void.attributes
    end

    assert_redirected_to void_path(assigns(:void))
  end

  test "should show void" do
    get :show, id: @void.to_param
    assert_response :success
  end
  test "invalid litleTxnId" do
      get :show, id: @void.to_param
      assert_equal("No transaction found with specified litleTxnId",assigns(:message))
      assert_template("voids/error","layouts/application")  
  end
  test "should get edit" do
    get :edit, id: @void.to_param
    assert_response :success
  end

  test "should update void" do
    put :update, id: @void.to_param, void: @void.attributes
    assert_redirected_to void_path(assigns(:void))
  end

  test "should destroy void" do
    assert_difference('Void.count', -1) do
      delete :destroy, id: @void.to_param
    end

    assert_redirected_to voids_path
  end
end
