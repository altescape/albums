class AlbumsController < ApplicationController
  before_action :check_login, :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new

    @album_collection = @album.get_album_collection(current_user)
    @album = @album_collection.albums.create(@album.find_album(params[:a], params[:p]))

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

    # find current users album collection id
    @album_collection = @album.get_album_collection(current_user)
    @album = Album.find(params[:id])

    if @album.album_collection_id == @album_collection.id

      album_params = @album.find_album(params[:a], params[:p])

      respond_to do |format|
        if @album.update(album_params)
          format.html { redirect_to your_top_5_url, notice: 'Album was successfully updated.' }
          format.json { render :show, status: :ok, location: @album }
        else
          format.html { render :edit }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    else
      raise 'Error: unauthorised action'
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

  def sort
    params[:order].each do |key,value|
      Album.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :artist, :image, :position)
    end
end
