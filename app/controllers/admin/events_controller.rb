class Admin::EventsController < Admin::AdminController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_date)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.friendly.find(params[:id])

    if(@event.secret_hash.blank?)
      @event.secret_hash = SecureRandom.hex(4)
      #@event.save
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.secret_hash = SecureRandom.hex(4)

    respond_to do |format|
      if @event.save
        format.html {
          redirect_to edit_admin_event_path(@event), notice: 'The event was successfully created.'
        }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.friendly.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        format.html {
          redirect_to edit_admin_event_path(@event), notice: 'The event was successfully updated.' 
        }
        format.json { render action: 'show', status: :updated, location: @event }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.friendly.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params
      .require(:event)
      .permit(:event_no, :slug, :title, :lead, :description, :facebook_page, :facebook_event, :call_to_action_url, :call_to_action_text, :manifesto, :livestream, :start_date, :finish_date, :location, :cover, :trailer, :facebook_image, :published, :cool_room, :thanks_header, :thanks_text, :completed, :artist_id, :soundcloud_embed, :cover_crop_x, :cover_crop_y, :cover_crop_w, :cover_crop_h, :trailer_crop_x, :trailer_crop_y, :trailer_crop_w, :trailer_crop_h)
    end
end
