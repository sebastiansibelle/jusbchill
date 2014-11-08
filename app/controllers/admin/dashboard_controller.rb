class Admin::DashboardController < Admin::AdminController
  def index
    @releases = Release.all
  end
end
