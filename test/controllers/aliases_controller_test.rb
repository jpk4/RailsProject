require 'test_helper'

class AliasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aliases_index_url
    assert_response :success
  end

  test "should get show" do
    get aliases_show_url
    assert_response :success
  end

end
