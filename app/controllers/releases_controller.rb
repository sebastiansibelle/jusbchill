class ReleasesController < ApplicationController

  def index
    @releases = Release.published
  end

  def show
    @release = Release.friendly.find(params[:id])

    if @release.published == false
      if params[:secret] != @release.secret_hash
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
