class ForecastFacade
  def self.fetch_weather(location)
    lat_long = GeoService.fetch_lat_long(location)
    forcast_data = ForecastService.fetch_weather(lat_long)
    current_weather = CurrentWeather.new(forcast_data[:current])
  end
end
