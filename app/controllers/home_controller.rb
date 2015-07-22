class HomeController < ApplicationController
  def index
    @releases = Release.published.limit(6)
    @mixes = Mix.published.limit(6)
    @events = Event.published.limit(2)
  end

  def about
  end

  def privacy
  end

  def legal
  end
end
