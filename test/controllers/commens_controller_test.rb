require 'test_helper'

class CommensControllerTest < ActionController::TestCase
  setup do
    @commen = commens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commen" do
    assert_difference('Commen.count') do
      post :create, commen: { body: @commen.body, idea_id: @commen.idea_id, user_name: @commen.user_name }
    end

    assert_redirected_to commen_path(assigns(:commen))
  end

  test "should show commen" do
    get :show, id: @commen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commen
    assert_response :success
  end

  test "should update commen" do
    patch :update, id: @commen, commen: { body: @commen.body, idea_id: @commen.idea_id, user_name: @commen.user_name }
    assert_redirected_to commen_path(assigns(:commen))
  end

  test "should destroy commen" do
    assert_difference('Commen.count', -1) do
      delete :destroy, id: @commen
    end

    assert_redirected_to commens_path
  end
end
