class PerformancesController < ApplicationController

  def show
    @performance = Performance.find(params[:id])

    # if @performance.published == false
    #   if params[:secret] != @performance.secret_hash
    #     raise ActionController::RoutingError.new('Not Found')
    #   end
    # end
  end
end
