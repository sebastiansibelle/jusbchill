class HomeController < ApplicationController
  def index
    @releases = Release.published.limit(6)
    @mixes = Mix.published.limit(6)
    @events = Event.upcoming.limit(3);
  end

  def about
  end

  def privacy
  end

  def legal
  end
end
