class Api::V1::Forecast::SearchController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastFacade.fetch_weather(params[:location]))
  end
end
