
require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | FRIENDS CORNER"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Helping Hands"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Read About Friends Corner"
  end 
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | For any Querry Check Here-"
  end



end
