class Api::V1::MunchiesController < ApplicationController
  def show
    render json: MunchiesFacade.fetch_data(params['start'], params['destination'], params['food'])
  end
end
