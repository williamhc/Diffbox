require 'test_helper'

class DropboxAuthControllerTest < ActionController::TestCase
  test "should get authorize" do
    get :authorize
    assert_response :success
  end

  test "should get authorize_callback" do
    get :authorize_callback
    assert_response :success
  end

end
