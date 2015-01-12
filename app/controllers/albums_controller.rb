class AlbumsController < ApplicationController
  before_action :check_login, :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create

    search = Search.new
    album = search.get_album(params[:a])

    @album_collection = AlbumCollection.find_by(user_id: current_user.id)

    @album = @album_collection.albums.create(name: album[:name], artist: album[:name], image: album[:image], position: params[:p])

    respond_to do |format|
      if @album.save
        format.html { redirect_to your_top_5_url, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to your_top_5_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  def change_order

  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :artist, :image, :position)
    end
end
