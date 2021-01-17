require 'rails_helper'

describe CurrentWeather do
  before :each do
    @data = {
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
  end
  it 'exists' do
    weather = CurrentWeather.new(@data)
    expect(weather).to be_a(CurrentWeather)
    expect(weather.datetime).to eq('2021-01-17 12:00:00 -0700')
    expect(weather.sunrise).to eq('2021-01-17 07:18:07 -0700')
    expect(weather.sunset).to eq('2021-01-17 07:18:07 -0700')
    expect(weather.temperature).to eq(47.8)
    expect(weather.feels_like).to eq(41.58)
    expect(weather.humidity).to eq(28)
    expect(weather.uvi).to eq(1.65)
    expect(weather.conditions).to eq('windy')
    expect(weather.icon).to eq('04g')
  end
end
