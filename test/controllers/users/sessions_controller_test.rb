require 'test_helper'

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new_guest" do
    get users_sessions_new_guest_url
    assert_response :success
  end
end
