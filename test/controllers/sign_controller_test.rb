require "test_helper"

class SignControllerTest < ActionDispatch::IntegrationTest
  test "should get up" do
    get sign_up_url
    assert_response :success
  end
end
