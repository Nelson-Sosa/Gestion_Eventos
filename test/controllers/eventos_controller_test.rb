require "test_helper"

class EventosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eventos_index_url
    assert_response :success
  end

  test "should get show" do
    get eventos_show_url
    assert_response :success
  end

  test "should get new" do
    get eventos_new_url
    assert_response :success
  end

  test "should get edit" do
    get eventos_edit_url
    assert_response :success
  end
end
