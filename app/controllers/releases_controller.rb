class ReleasesController < ApplicationController
  http_basic_authenticate_with name: "ssibelle", password: "hawker05", only: [:create, :destroy]

  def index
    @releases = Release.all
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @release = @artist.releases.create(release_params)
    redirect_to artist_path(@artist)
  end
 
 def destroy
    @artist = Artist.find(params[:artist_id])
    @release = @artist.releases.find(params[:id])
    @release.destroy
    redirect_to artist_path(@artist)
  end

  private
    def release_params
      params.require(:release).permit(:title, :description)
    end
end
