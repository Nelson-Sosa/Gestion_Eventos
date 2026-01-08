require "test_helper"

class ContratosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contratos_index_url
    assert_response :success
  end

  test "should get show" do
    get contratos_show_url
    assert_response :success
  end

  test "should get new" do
    get contratos_new_url
    assert_response :success
  end

  test "should get edit" do
    get contratos_edit_url
    assert_response :success
  end
end
