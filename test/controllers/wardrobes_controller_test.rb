require 'test_helper'

class WardrobesControllerTest < ActionController::TestCase
  setup do
    @wardrobe = wardrobes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wardrobes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wardrobe" do
    assert_difference('Wardrobe.count') do
      post :create, wardrobe: { clothing_id: @wardrobe.clothing_id, user_id: @wardrobe.user_id }
    end

    assert_redirected_to wardrobe_path(assigns(:wardrobe))
  end

  test "should show wardrobe" do
    get :show, id: @wardrobe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wardrobe
    assert_response :success
  end

  test "should update wardrobe" do
    patch :update, id: @wardrobe, wardrobe: { clothing_id: @wardrobe.clothing_id, user_id: @wardrobe.user_id }
    assert_redirected_to wardrobe_path(assigns(:wardrobe))
  end

  test "should destroy wardrobe" do
    assert_difference('Wardrobe.count', -1) do
      delete :destroy, id: @wardrobe
    end

    assert_redirected_to wardrobes_path
  end
end
