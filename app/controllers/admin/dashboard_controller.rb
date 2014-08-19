class Admin::DashboardController < Admin::AdminController
  def index
    @artists = Artist.all
  end
end
