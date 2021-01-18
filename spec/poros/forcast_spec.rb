require 'rails_helper'

describe Forecast do
  it 'exists' do
    current_data = {
      dt: 1_610_910_000,
      sunrise: 1_610_893_087,
      sunset: 1_610_893_087,
      temp: 47.8,
      feels_like: 41.58,
      humidity: 28,
      uvi: 1.65,
      visibility: 10_000,
      weather: [{ description: 'windy', icon: '04g' }]
    }

    daily_data = {
      dt: 1_610_910_000,
      sunrise: 1_610_893_087,
      sunset: 1_610_928_108,
      temp: { max: 90.0, min: 60.5 },
      weather: [{ description: 'windy', icon: '04g' }]
    }

    hourly_data = {
      dt: 1_610_910_000,
      temp: 47.21,
      wind_speed: 1.72,
      wind_deg: 173,
      weather: [{ description: 'windy', icon: '04g' }]
    }

    current_weather = CurrentWeather.new(current_data)
    daily_weather = DailyWeather.new(daily_data)
    hourly_weather = HourlyWeather.new(hourly_data)

    weather = Forecast.new(current_weather, daily_weather, hourly_weather)
    expect(weather).to be_a(Forecast)
    expect(weather.current_weather).to be_a(CurrentWeather)
    expect(weather.daily_weather).to be_a(DailyWeather)
    expect(weather.hourly_weather).to be_a(HourlyWeather)
  end
end
