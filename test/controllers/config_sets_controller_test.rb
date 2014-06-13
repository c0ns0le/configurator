require 'test_helper'

class ConfigSetsControllerTest < ActionController::TestCase
  setup do
    @config_set = config_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_set" do
    assert_difference('ConfigSet.count') do
      post :create, config_set: { config_type: @config_set.config_type, deleted_at: @config_set.deleted_at, expired_at: @config_set.expired_at, name: @config_set.name }
    end

    assert_redirected_to config_set_path(assigns(:config_set))
  end

  test "should show config_set" do
    get :show, id: @config_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @config_set
    assert_response :success
  end

  test "should update config_set" do
    patch :update, id: @config_set, config_set: { config_type: @config_set.config_type, deleted_at: @config_set.deleted_at, expired_at: @config_set.expired_at, name: @config_set.name }
    assert_redirected_to config_set_path(assigns(:config_set))
  end

  test "should destroy config_set" do
    assert_difference('ConfigSet.count', -1) do
      delete :destroy, id: @config_set
    end

    assert_redirected_to config_sets_path
  end
end
