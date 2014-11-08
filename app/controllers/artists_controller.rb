class ArtistsController < ApplicationController
  def index
    @artists = Artist.published
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end
end