class Admin::AdminController < ApplicationController
  # Core admin controller. Do not instantiate directly. 

  layout "admin"
  before_filter :authenticate_user!
end