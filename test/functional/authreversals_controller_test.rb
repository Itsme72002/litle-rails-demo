require 'test_helper'

class AuthreversalsControllerTest < ActionController::TestCase
  setup do
    @authreversal = authreversals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authreversals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authreversal" do
    assert_difference('Authreversal.count') do
      post :create, authreversal: @authreversal.attributes
    end

    assert_redirected_to authreversal_path(assigns(:authreversal))
  end

  test "should show authreversal" do
    get :show, id: @authreversal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authreversal.to_param
    assert_response :success
  end

  test "should update authreversal" do
    put :update, id: @authreversal.to_param, authreversal: @authreversal.attributes
    assert_redirected_to authreversal_path(assigns(:authreversal))
  end

  test "should destroy authreversal" do
    assert_difference('Authreversal.count', -1) do
      delete :destroy, id: @authreversal.to_param
    end

    assert_redirected_to authreversals_path
  end
end
