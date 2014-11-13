class ErrorsController < ApplicationController
  def four_oh_four
    render status: :not_found
  end
end