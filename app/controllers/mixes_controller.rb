class MixesController < ApplicationController
  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
    @mix = Mix.friendly.find(params[:id])

    if @mix.published == false
      if params[:secret] != @mix.secret_hash
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
