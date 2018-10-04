class ApplicationController < ActionController::Base

  def rates
    render json: ProjectDatum.get_value("open_exchange_rates")
  end

end
