class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.includes(:artists => :performances).friendly.find(params[:id])

    if @event.published == false
      if params[:secret] != @event.secret_hash
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    @event_already_happened = @event.finish_date < Time.zone.now;
  end

  def episode1
  end

  def episode2
  end

  def episode3
  end
end
