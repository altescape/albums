class SearchController < ApplicationController

  before_action :check_login

  def search
    @search = Search.new
    @albums = @search.search_albums(params[:s])
    render :search
  end
end