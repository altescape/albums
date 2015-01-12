class AlbumCollectionsController < ApplicationController
  before_action :check_login, :set_album_collection, only: [:show, :edit, :update, :destroy]

  def index
    @album_collections = AlbumCollection.all
  end

  def show
  end

  def new
    @album_collection = AlbumCollection.new
  end

  def create
    @album_collection = AlbumCollection.new(album_collection_params)

    respond_to do |format|
      if @album_collection.save
        format.html { redirect_to @album_collection, notice: 'Album collection was successfully created.' }
        format.json { render :show, status: :created, location: @album_collection }
      else
        format.html { render :new }
        format.json { render json: @album_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album_collection.update(album_collection_params)
        format.html { redirect_to @album_collection, notice: 'Album collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @album_collection }
      else
        format.html { render :edit }
        format.json { render json: @album_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album_collection.destroy
    respond_to do |format|
      format.html { redirect_to album_collections_url, notice: 'Album collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_album_collection
      @album_collection = AlbumCollection.find_by(user_id: current_user.id)
    end

    def album_collection_params
      params.require(:album_collection).permit(:user)
    end
end
