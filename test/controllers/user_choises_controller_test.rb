require 'test_helper'

class UserChoisesControllerTest < ActionController::TestCase
  setup do
    @user_choise = user_choises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_choises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_choise" do
    assert_difference('UserChoise.count') do
      post :create, user_choise: { clothing_id: @user_choise.clothing_id, liked: @user_choise.liked, time: @user_choise.time, user_id: @user_choise.user_id }
    end

    assert_redirected_to user_choise_path(assigns(:user_choise))
  end

  test "should show user_choise" do
    get :show, id: @user_choise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_choise
    assert_response :success
  end

  test "should update user_choise" do
    patch :update, id: @user_choise, user_choise: { clothing_id: @user_choise.clothing_id, liked: @user_choise.liked, time: @user_choise.time, user_id: @user_choise.user_id }
    assert_redirected_to user_choise_path(assigns(:user_choise))
  end

  test "should destroy user_choise" do
    assert_difference('UserChoise.count', -1) do
      delete :destroy, id: @user_choise
    end

    assert_redirected_to user_choises_path
  end
end
