class ReleasesController < ApplicationController

  def index
    @releases = Release.all
  end
end
