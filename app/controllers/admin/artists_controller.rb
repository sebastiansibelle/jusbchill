class Admin::ArtistsController < Admin::AdminController
  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.friendly.find(params[:id])
  end

  def update
    @artist = Artist.friendly.find(params[:id])
    
    respond_to do |format|
      if @artist.update(artist_params)
        format.html {
          if params[:artist][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_artist_path(@artist), notice: 'The artist was successfully updated.'
          end
        }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @artist = Artist.new(artist_params)
    
    respond_to do |format|
      if @artist.save
        format.html {
          if params[:artist][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_artist_path(@artist), notice: 'The artist was successfully created.'
          end
        }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist = Artist.friendly.find(params[:id])
    @artist.destroy

    redirect_to admin_artists_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :biography, :avatar, :facebook, :soundcloud, :twitter, :soundcloud_embed, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :published)
    end
end
