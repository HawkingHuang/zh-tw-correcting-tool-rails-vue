require "test_helper"

class CheckControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get check_index_url
    assert_response :success
  end

  test "should get examine" do
    get check_examine_url
    assert_response :success
  end
end
