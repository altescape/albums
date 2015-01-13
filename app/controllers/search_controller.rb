class SearchController < ApplicationController

  before_action :check_login

  def search

    @search = Search.new

    @albums = []

    if params[:search]
      @albums = @search.search_albums(params[:search]['search'])
    end

    respond_to do |format|
      format.html { render :search }
    end
  end
end