class Admin::MixesController < Admin::AdminController
  # before_action :set_mix, only: [:show, :edit, :update, :destroy]

  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all
  end

  # GET /mixes/new
  def new
    @mix = Mix.new
  end

  # GET /mixes/1/edit
  def edit
    @mix = Mix.friendly.find(params[:id])

    if(@mix.secret_hash.blank?)
      @mix.secret_hash = SecureRandom.hex(4)
    end

    @mix.save
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = Mix.new(mix_params)
    @mix.secret_hash = SecureRandom.hex(4)

    respond_to do |format|
      if @mix.save
        format.html {
          if params[:mix][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_mix_path(@mix), notice: 'The mix was successfully created.'
          end
        }
        format.json { render action: 'show', status: :created, location: @mix }
      else
        format.html { render action: "new" }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixes/1
  # PATCH/PUT /mixes/1.json
  def update
    @mix = Mix.friendly.find(params[:id])

    respond_to do |format|
      if @mix.update(mix_params)
        format.html {
          if params[:mix][:avatar].present?
            render "crop"
          else
            redirect_to edit_admin_mix_path(@mix), notice: 'The mix was successfully created.'
          end
        }
        format.json { render action: 'show', status: :created, location: @mix }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy
    respond_to do |format|
      format.html { redirect_to mixes_url, notice: 'Mix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_mix
    #   @mix = Mix.friendly.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mix_params
      params.require(:mix).permit(:mix_no, :title, :description, :avatar, :artist_id, :soundcloud_embed, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :published)
    end
end
