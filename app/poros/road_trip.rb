class RoadTrip
  attr_reader :location,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(location, destination, travel_time, arrival_forecast)
    @location = location
    @destination = destination
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end
end
