class MunchiesFacade
  def self.fetch_data(location, destination, food)
    resturant_data = YelpService.fetch_resturants(food, location)
    resturant = Resturant.new(resturant_data)
    travel_data = GeoService.fetch_travel_data(location, destination)
    destination = Destination.new(travel_data)
    lat_long = GeoService.fetch_lat_long(destination)
    forecast_data = ForecastService.fetch_weather(lat_long)
    current_weather = DestinationWeather.new(forecast_data[:current])
    Munchie.new(destination, resturant, current_weather)
  end
end
