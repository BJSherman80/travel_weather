require 'rails_helper'

describe HourlyWeather do
  before :each do
    @data = {
      dt: 1_610_910_000,
      temp: 47.21,
      wind_speed: 1.72,
      wind_deg: 173,
      weather: [{ description: 'windy', icon: '04g' }]
    }
  end
  it 'exists' do
    weather = HourlyWeather.new(@data)
    expect(weather).to be_a(HourlyWeather)
    expect(weather.time).to eq(' 2021-01-17 12:00:00 -0700')
    expect(weather.temperature).to eq(47.21)
    expect(weather.wind_speed).to eq(1.72)
    expect(weather.wind_direction).to eq('S')
    expect(weather.conditions).to eq('windy')
    expect(weather.icon).to eq('04g')
  end

  it '.cardinal_direction' do
    expect(@data[:wind_deg]).to eq(173)
    weather = HourlyWeather.new(@data)
    expect(weather.wind_direction).to eq('S')
    # expect(cardinal_direction(173)).to eq('S')
  end
end
