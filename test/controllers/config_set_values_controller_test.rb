require 'test_helper'

class ConfigSetValuesControllerTest < ActionController::TestCase
  setup do
    @config_set_value = config_set_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_set_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_set_value" do
    assert_difference('ConfigSetValue.count') do
      post :create, config_set_value: { config_set_id: @config_set_value.config_set_id, data_type: @config_set_value.data_type, deleted_at: @config_set_value.deleted_at, expired_at: @config_set_value.expired_at, key: @config_set_value.key, organization_id: @config_set_value.organization_id, status: @config_set_value.status, value: @config_set_value.value }
    end

    assert_redirected_to config_set_value_path(assigns(:config_set_value))
  end

  test "should show config_set_value" do
    get :show, id: @config_set_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @config_set_value
    assert_response :success
  end

  test "should update config_set_value" do
    patch :update, id: @config_set_value, config_set_value: { config_set_id: @config_set_value.config_set_id, data_type: @config_set_value.data_type, deleted_at: @config_set_value.deleted_at, expired_at: @config_set_value.expired_at, key: @config_set_value.key, organization_id: @config_set_value.organization_id, status: @config_set_value.status, value: @config_set_value.value }
    assert_redirected_to config_set_value_path(assigns(:config_set_value))
  end

  test "should destroy config_set_value" do
    assert_difference('ConfigSetValue.count', -1) do
      delete :destroy, id: @config_set_value
    end

    assert_redirected_to config_set_values_path
  end
end
