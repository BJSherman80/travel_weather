class ForecastFacade
  def self.fetch_weather(location)
    lat_long = GeoService.fetch_lat_long(location)
    forecast_data = ForecastService.fetch_weather(lat_long)
    current_weather = CurrentWeather.new(forecast_data[:current])
    daily_weather = daily(limit_daily_5(forecast_data))
    hourly_weather = hourly(limit_hourly_8(forecast_data))
  end

  def self.limit_daily_5(_data)
    _data[:daily][0..4]
  end

  def self.limit_hourly_8(_data)
    _data[:hourly][0..7]
  end

  def self.daily(_five_day_forecast)
    _five_day_forecast.map do |data|
      DailyWeather.new(data)
    end
  end

  def self.hourly(_eight_hour_forecast)
    _eight_hour_forecast.map do |data|
      HourlyWeather.new(data)
    end
  end
end
