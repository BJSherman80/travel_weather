class RoadTripFacade
  def self.fetch_data(location, destination)
    travel_data = GeoService.fetch_travel_data(location, destination)
    lat_long = GeoService.fetch_lat_long(destination)
    forecast_data = ForecastService.fetch_weather(lat_long)[:hourly]
    travel_seconds = travel_seconds(travel_data) # seconds to add to time.now
    arrival_forecast = find_weather(travel_seconds, forecast_data)
    travel_time = confirm_time(travel_data) # hours mins
    RoadTrip.new(location, destination, travel_time, arrival_forecast)
  end

  def self.find_weather(travel_seconds, forecast_data)
    arrival_time = travel_seconds[0] + DateTime.now.to_i
    weather = forecast_data.find { |forecast| forecast[:dt] >= arrival_time }
    ArrivalWeather.new(weather)
  end

  def self.confirm_time(data)
    if data[:route][:realTime].nil? || data[:route][:realTime] == 0
      'Impossible route'
    else
      Time.at(data[:route][:realTime]).utc.strftime('%H hours %M minutes')
    end
  end

  def self.travel_seconds(data)
    if !data[:route][:legs].nil?
      (data[:route][:legs][0][:time])
    else
      0
    end
  end
end
