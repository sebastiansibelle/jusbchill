class HomeController < ApplicationController
  def index
    @releases = Release.published
  end

  def about
  end

  def privacy
  end

  def legal
  end
end
