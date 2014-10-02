require 'test_helper'

class PhotoSizesControllerTest < ActionController::TestCase
  setup do
    @photo_size = photo_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_size" do
    assert_difference('PhotoSize.count') do
      post :create, photo_size: { account_id: @photo_size.account_id, title: @photo_size.title }
    end

    assert_redirected_to photo_size_path(assigns(:photo_size))
  end

  test "should show photo_size" do
    get :show, id: @photo_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_size
    assert_response :success
  end

  test "should update photo_size" do
    patch :update, id: @photo_size, photo_size: { account_id: @photo_size.account_id, title: @photo_size.title }
    assert_redirected_to photo_size_path(assigns(:photo_size))
  end

  test "should destroy photo_size" do
    assert_difference('PhotoSize.count', -1) do
      delete :destroy, id: @photo_size
    end

    assert_redirected_to photo_sizes_path
  end
end
