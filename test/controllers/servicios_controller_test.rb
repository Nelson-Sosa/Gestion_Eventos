require "test_helper"

class ServiciosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get servicios_index_url
    assert_response :success
  end

  test "should get show" do
    get servicios_show_url
    assert_response :success
  end

  test "should get new" do
    get servicios_new_url
    assert_response :success
  end

  test "should get edit" do
    get servicios_edit_url
    assert_response :success
  end
end
