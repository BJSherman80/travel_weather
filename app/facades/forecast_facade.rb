class ForecastFacade
  def self.fetch_weather(location)
    lat_long = GeoService.fetch_lat_long(location)
    forecast_data = ForecastService.fetch_weather(lat_long)
    current_weather = CurrentWeather.new(forecast_data[:current])
    daily_weather = daily(limit_daily_5(forecast_data))
  end

  def self.limit_daily_5(data)
    data[:daily][0..4]
  end

  def self.daily(five_day_forcast)
    five_day_forcast.map do |data|
      DailyWeather.new(data)
    end
  end
end
