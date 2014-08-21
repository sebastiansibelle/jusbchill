class HomeController < ApplicationController
  def index
    @releases = Release.all
  end

  def about
  end
end
