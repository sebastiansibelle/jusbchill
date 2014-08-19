class ArtistsController < ApplicationController
  http_basic_authenticate_with name: "ssibelle", password: "hawker05", except: [:index, :show]

  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def create
    @artist = Artist.new(artist_params)
    
    if @artist.save
      redirect_to @artist
    else
      render 'new'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :biography)
    end
end
