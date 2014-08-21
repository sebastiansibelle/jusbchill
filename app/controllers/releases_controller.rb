class ReleasesController < ApplicationController

  def index
    @releases = Release.all
  end

  def show
    @release = Release.friendly.find(params[:id])
  end
end
