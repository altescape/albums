require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { band: @album.band, id: @album.id, image: @album.image, name: @album.name, position1: @album.position1, position2: @album.position2, position3: @album.position3, position4: @album.position4, position5: @album.position5, totalPositions: @album.totalPositions }
    end

    assert_redirected_to album_path(assigns(:album))
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album
    assert_response :success
  end

  test "should update album" do
    patch :update, id: @album, album: { band: @album.band, id: @album.id, image: @album.image, name: @album.name, position1: @album.position1, position2: @album.position2, position3: @album.position3, position4: @album.position4, position5: @album.position5, totalPositions: @album.totalPositions }
    assert_redirected_to album_path(assigns(:album))
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_redirected_to albums_path
  end
end
