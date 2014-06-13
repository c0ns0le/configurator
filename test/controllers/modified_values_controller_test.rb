require 'test_helper'

class ModifiedValuesControllerTest < ActionController::TestCase
  setup do
    @modified_value = modified_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modified_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modified_value" do
    assert_difference('ModifiedValue.count') do
      post :create, modified_value: { key: @modified_value.key, organization_id: @modified_value.organization_id, service_id: @modified_value.service_id, status: @modified_value.status, value: @modified_value.value }
    end

    assert_redirected_to modified_value_path(assigns(:modified_value))
  end

  test "should show modified_value" do
    get :show, id: @modified_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modified_value
    assert_response :success
  end

  test "should update modified_value" do
    patch :update, id: @modified_value, modified_value: { key: @modified_value.key, organization_id: @modified_value.organization_id, service_id: @modified_value.service_id, status: @modified_value.status, value: @modified_value.value }
    assert_redirected_to modified_value_path(assigns(:modified_value))
  end

  test "should destroy modified_value" do
    assert_difference('ModifiedValue.count', -1) do
      delete :destroy, id: @modified_value
    end

    assert_redirected_to modified_values_path
  end
end
