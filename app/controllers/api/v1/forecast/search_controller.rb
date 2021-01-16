class Api::V1::Forecast::SearchController < ApplicationController
  def index
    render json: ForcastFacade.fetch_weather(params[:location])
  end
end
