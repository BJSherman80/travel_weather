class ForcastFacade
  def self.fetch_weather(location)
    lat_long = GeoService.fetch_lat_long(location)
    ForecastService.get_weather(lat_long)
  end
end
