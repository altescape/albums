class SearchController < ApplicationController

  def search
    @search = Search.new
    @albums = @search.search_albums(params[:s])
    render :search
  end

end