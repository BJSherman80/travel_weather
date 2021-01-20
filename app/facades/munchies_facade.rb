class MunchiesFacade
  def self.fetch_data(location, destination, food)
    resturant_data = YelpService.fetch_resturants(food, destination)
    resturant = Resturant.new(resturant_data)
    travel_data = GeoService.fetch_travel_data(location, destination)
    destination = Destination.new(travel_data, destination)
    lat_long = GeoService.fetch_lat_long(destination)
    forecast_data = ForecastService.fetch_weather(lat_long)
    destination_weather = DestinationWeather.new(forecast_data[:current])
    Munchie.new(destination, resturant, destination_weather)
  end
end
