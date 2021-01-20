class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      location = params['road_trip']['origin']
      destination = params['road_trip']['destination']
      road_trip = RoadTripFacade.fetch_data(location, destination)
      render json: RoadTripSerializer.new(road_trip), status: 200
    else
      render json: { error: 'Error with api_key/user info' }, status: 400
    end
  end
end
