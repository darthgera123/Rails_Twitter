require 'test_helper'
# Integration tests effectively simulate a browser clicking from page to page. 
class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

end
