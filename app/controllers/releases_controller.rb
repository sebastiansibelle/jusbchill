class ReleasesController < ApplicationController
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
