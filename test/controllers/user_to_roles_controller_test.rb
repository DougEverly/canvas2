require 'test_helper'

class UserToRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_to_role = user_to_roles(:one)
  end

  test "should get index" do
    get user_to_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_user_to_role_url
    assert_response :success
  end

  test "should create user_to_role" do
    assert_difference('UserToRole.count') do
      post user_to_roles_url, params: { user_to_role: { role_id: @user_to_role.role_id, user_id: @user_to_role.user_id } }
    end

    assert_redirected_to user_to_role_url(UserToRole.last)
  end

  test "should show user_to_role" do
    get user_to_role_url(@user_to_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_to_role_url(@user_to_role)
    assert_response :success
  end

  test "should update user_to_role" do
    patch user_to_role_url(@user_to_role), params: { user_to_role: { role_id: @user_to_role.role_id, user_id: @user_to_role.user_id } }
    assert_redirected_to user_to_role_url(@user_to_role)
  end

  test "should destroy user_to_role" do
    assert_difference('UserToRole.count', -1) do
      delete user_to_role_url(@user_to_role)
    end

    assert_redirected_to user_to_roles_url
  end
end
