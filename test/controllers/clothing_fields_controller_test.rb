require 'test_helper'

class ClothingFieldsControllerTest < ActionController::TestCase
  setup do
    @clothing_field = clothing_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clothing_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clothing_field" do
    assert_difference('ClothingField.count') do
      post :create, clothing_field: { func: @clothing_field.func, name: @clothing_field.name, type: @clothing_field.type }
    end

    assert_redirected_to clothing_field_path(assigns(:clothing_field))
  end

  test "should show clothing_field" do
    get :show, id: @clothing_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clothing_field
    assert_response :success
  end

  test "should update clothing_field" do
    patch :update, id: @clothing_field, clothing_field: { func: @clothing_field.func, name: @clothing_field.name, type: @clothing_field.type }
    assert_redirected_to clothing_field_path(assigns(:clothing_field))
  end

  test "should destroy clothing_field" do
    assert_difference('ClothingField.count', -1) do
      delete :destroy, id: @clothing_field
    end

    assert_redirected_to clothing_fields_path
  end
end
