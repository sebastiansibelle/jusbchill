class HomeController < ApplicationController
  def index
    @releases = Release.published
    @mixes = Mix.published
  end

  def about
  end

  def privacy
  end

  def legal
  end
end
