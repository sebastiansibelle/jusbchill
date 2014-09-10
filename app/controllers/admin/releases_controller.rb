class Admin::ReleasesController < Admin::AdminController
  def new
    @release = Release.new
  end

  def index
    @releases = Release.all
  end

  def edit
    @release = Release.friendly.find(params[:id])
  end

  def update
    @release = Release.friendly.find(params[:id])

    respond_to do |format|
      if @release.update(release_params)
        format.html {
          if params[:release][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_release_path(@release), notice: 'The release was successfully created.'
          end
        }
        format.json { render action: 'show', status: :created, location: @release }
      else
        format.html { render action: 'edit' }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @release = Release.new(release_params)
    
    respond_to do |format|
      if @release.save
        format.html {
          if params[:release][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_release_path(@release), notice: 'The release was successfully created.'
          end
        }
        format.json { render action: 'show', status: :created, location: @release }
      else
        format.html { render action: 'new' }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end


 def destroy
    @release = Release.friendly.find(params[:id])
    @release.destroy

    redirect_to admin_releases_path
  end

  private
    def release_params
      params.require(:release).permit(:title, :description, :artist_id, :release_no, :avatar, :soundcloud_embed, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :published)
    end
end
