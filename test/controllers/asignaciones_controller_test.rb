require "test_helper"

class AsignacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get asignaciones_index_url
    assert_response :success
  end

  test "should get show" do
    get asignaciones_show_url
    assert_response :success
  end

  test "should get new" do
    get asignaciones_new_url
    assert_response :success
  end

  test "should get edit" do
    get asignaciones_edit_url
    assert_response :success
  end
end
