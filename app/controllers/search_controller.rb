class SearchController < ApplicationController

  before_action :check_login

  def search

    @search = Search.new

    if params[:s].blank?
      search_param = @search.random_artist
    else
      search_param = params[:s]
    end

    @albums = @search.search_albums(search_param)
    render :search
  end
end