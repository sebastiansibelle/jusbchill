class HomeController < ApplicationController
  def index
    @releases = Release.all
  end

  def about
  end

  def privacy
  end

  def legal
  end
end
