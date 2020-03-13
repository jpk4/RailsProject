require 'test_helper'

class SeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seats_index_url
    assert_response :success
  end

  test "should get show" do
    get seats_show_url
    assert_response :success
  end

end
