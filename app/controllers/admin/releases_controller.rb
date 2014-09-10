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
    
    if @release.update(release_params)
      redirect_to edit_admin_release_path
    else
      render 'edit'
    end
  end

  def create
    @release = Release.new(release_params)

    if @release.save
      redirect_to edit_admin_release_path(@release)
    else
      render 'new'
    end
  end
 
 def destroy
    @release = Release.friendly.find(params[:id])
    @release.destroy

    redirect_to admin_releases_path
  end

  private
    def release_params
      params.require(:release).permit(:title, :description, :artist_id, :release_no, :avatar, :soundcloud_embed)
    end
end
