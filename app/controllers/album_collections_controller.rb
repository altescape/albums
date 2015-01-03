class AlbumCollectionsController < ApplicationController
  before_action :set_album_collection, only: [:show, :edit, :update, :destroy]

  # GET /album_collections
  # GET /album_collections.json
  def index
    @album_collections = AlbumCollection.all
  end

  # GET /album_collections/1
  # GET /album_collections/1.json
  def show
  end

  # GET /album_collections/new
  def new
    @album_collection = AlbumCollection.new
  end

  # GET /album_collections/1/edit
  def edit
  end

  # POST /album_collections
  # POST /album_collections.json
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

  # PATCH/PUT /album_collections/1
  # PATCH/PUT /album_collections/1.json
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

  # DELETE /album_collections/1
  # DELETE /album_collections/1.json
  def destroy
    @album_collection.destroy
    respond_to do |format|
      format.html { redirect_to album_collections_url, notice: 'Album collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_collection
      # @album_collection = AlbumCollection.find(params[:id])
      @album_collection = AlbumCollection.find_by user_id: current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_collection_params
      params.require(:album_collection).permit(:user)
    end
end
