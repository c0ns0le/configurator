require 'test_helper'

class ServiceDefaultValuesControllerTest < ActionController::TestCase
  setup do
    @service_default_value = service_default_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_default_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_default_value" do
    assert_difference('ServiceDefaultValue.count') do
      post :create, service_default_value: { deleted_at: @service_default_value.deleted_at, expired_at: @service_default_value.expired_at, key: @service_default_value.key, service_id: @service_default_value.service_id, status: @service_default_value.status, value: @service_default_value.value }
    end

    assert_redirected_to service_default_value_path(assigns(:service_default_value))
  end

  test "should show service_default_value" do
    get :show, id: @service_default_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_default_value
    assert_response :success
  end

  test "should update service_default_value" do
    patch :update, id: @service_default_value, service_default_value: { deleted_at: @service_default_value.deleted_at, expired_at: @service_default_value.expired_at, key: @service_default_value.key, service_id: @service_default_value.service_id, status: @service_default_value.status, value: @service_default_value.value }
    assert_redirected_to service_default_value_path(assigns(:service_default_value))
  end

  test "should destroy service_default_value" do
    assert_difference('ServiceDefaultValue.count', -1) do
      delete :destroy, id: @service_default_value
    end

    assert_redirected_to service_default_values_path
  end
end
