class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @season_one_events = Event.season_one
    @season_two_events = Event.season_two
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

    @event_upcoming = Time.zone.now < @event.start_date;
    @event_live = Time.zone.now >= @event.start_date && Time.zone.now < @event.finish_date
    @event_already_happened = @event.finish_date < Time.zone.now;
    @event_finished = @event_already_happened && @event.completed;
  end

  def episode1
  end

  def episode2
  end

  def episode3
  end
end
