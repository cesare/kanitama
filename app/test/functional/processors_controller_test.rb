require 'test_helper'

class ProcessorsControllerTest < ActionController::TestCase
  setup do
    @processor = processors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processor" do
    assert_difference('Processor.count') do
      post :create, processor: @processor.attributes
    end

    assert_redirected_to processor_path(assigns(:processor))
  end

  test "should show processor" do
    get :show, id: @processor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processor
    assert_response :success
  end

  test "should update processor" do
    put :update, id: @processor, processor: @processor.attributes
    assert_redirected_to processor_path(assigns(:processor))
  end

  test "should destroy processor" do
    assert_difference('Processor.count', -1) do
      delete :destroy, id: @processor
    end

    assert_redirected_to processors_path
  end
end
