require 'rails_helper'

describe 'forecast facade' do
  it 'returns a forcast' do
    location = 'phoenix, az'
    forecast = ForecastFacade.fetch_weather(location)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.daily_weather[0]).to be_a(DailyWeather)
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.hourly_weather[0]).to be_a(HourlyWeather)
  end
end
