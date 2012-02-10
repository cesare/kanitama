require 'test_helper'

class BiosesControllerTest < ActionController::TestCase
  setup do
    @bios = bioses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bioses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bios" do
    assert_difference('Bios.count') do
      post :create, bios: @bios.attributes
    end

    assert_redirected_to bios_path(assigns(:bios))
  end

  test "should show bios" do
    get :show, id: @bios
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bios
    assert_response :success
  end

  test "should update bios" do
    put :update, id: @bios, bios: @bios.attributes
    assert_redirected_to bios_path(assigns(:bios))
  end

  test "should destroy bios" do
    assert_difference('Bios.count', -1) do
      delete :destroy, id: @bios
    end

    assert_redirected_to bioses_path
  end
end
