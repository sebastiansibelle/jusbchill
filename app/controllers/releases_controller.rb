class ReleasesController < ApplicationController

  def index
    @releases = Release.published
  end

  def show
    @release = Release.friendly.find(params[:id])
  end

  def mixes
  end
end
