class HomeController < ApplicationController
  def index
    @releases = Release.all
  end
end
