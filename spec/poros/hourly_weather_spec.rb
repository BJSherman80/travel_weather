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
    weather = HourlyWeather.new(@data)
    expect(weather.cardinal_direction(11)).to eq('N')
    expect(weather.cardinal_direction(33)).to eq('NNE')
    expect(weather.cardinal_direction(56)).to eq('NE')
    expect(weather.cardinal_direction(78)).to eq('ENE')
    expect(weather.cardinal_direction(101)).to eq('E')
    expect(weather.cardinal_direction(123)).to eq('ESE')
    expect(weather.cardinal_direction(146)).to eq('SE')
    expect(weather.cardinal_direction(168)).to eq('SSE')
    expect(weather.cardinal_direction(191)).to eq('S')
    expect(weather.cardinal_direction(213)).to eq('SSW')
    expect(weather.cardinal_direction(236)).to eq('SW')
    expect(weather.cardinal_direction(258)).to eq('WSW')
    expect(weather.cardinal_direction(281)).to eq('W')
    expect(weather.cardinal_direction(303)).to eq('WNW')
    expect(weather.cardinal_direction(326)).to eq('NW')
    expect(weather.cardinal_direction(348)).to eq('NNW')
    expect(weather.cardinal_direction(nil)).to eq('No Wind')
  end
end
