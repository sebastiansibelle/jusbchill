class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end
end
