require 'test_helper'

class BaseboardsControllerTest < ActionController::TestCase
  setup do
    @baseboard = baseboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baseboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baseboard" do
    assert_difference('Baseboard.count') do
      post :create, baseboard: @baseboard.attributes
    end

    assert_redirected_to baseboard_path(assigns(:baseboard))
  end

  test "should show baseboard" do
    get :show, id: @baseboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baseboard
    assert_response :success
  end

  test "should update baseboard" do
    put :update, id: @baseboard, baseboard: @baseboard.attributes
    assert_redirected_to baseboard_path(assigns(:baseboard))
  end

  test "should destroy baseboard" do
    assert_difference('Baseboard.count', -1) do
      delete :destroy, id: @baseboard
    end

    assert_redirected_to baseboards_path
  end
end
