require 'test_helper'

class AlbumCollectionsControllerTest < ActionController::TestCase
  setup do
    @album_collection = album_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_collection" do
    assert_difference('AlbumCollection.count') do
      post :create, album_collection: { albums: @album_collection.albums, id: @album_collection.id, name: @album_collection.name }
    end

    assert_redirected_to album_collection_path(assigns(:album_collection))
  end

  test "should show album_collection" do
    get :show, id: @album_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_collection
    assert_response :success
  end

  test "should update album_collection" do
    patch :update, id: @album_collection, album_collection: { albums: @album_collection.albums, id: @album_collection.id, name: @album_collection.name }
    assert_redirected_to album_collection_path(assigns(:album_collection))
  end

  test "should destroy album_collection" do
    assert_difference('AlbumCollection.count', -1) do
      delete :destroy, id: @album_collection
    end

    assert_redirected_to album_collections_path
  end
end
