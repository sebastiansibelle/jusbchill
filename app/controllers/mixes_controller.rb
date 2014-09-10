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
  end
end
