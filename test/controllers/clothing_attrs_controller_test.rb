require 'test_helper'

class ClothingAttrsControllerTest < ActionController::TestCase
  setup do
    @clothing_attr = clothing_attrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clothing_attrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clothing_attr" do
    assert_difference('ClothingAttr.count') do
      post :create, clothing_attr: { clothingField_id: @clothing_attr.clothingField_id, value: @clothing_attr.value }
    end

    assert_redirected_to clothing_attr_path(assigns(:clothing_attr))
  end

  test "should show clothing_attr" do
    get :show, id: @clothing_attr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clothing_attr
    assert_response :success
  end

  test "should update clothing_attr" do
    patch :update, id: @clothing_attr, clothing_attr: { clothingField_id: @clothing_attr.clothingField_id, value: @clothing_attr.value }
    assert_redirected_to clothing_attr_path(assigns(:clothing_attr))
  end

  test "should destroy clothing_attr" do
    assert_difference('ClothingAttr.count', -1) do
      delete :destroy, id: @clothing_attr
    end

    assert_redirected_to clothing_attrs_path
  end
end
