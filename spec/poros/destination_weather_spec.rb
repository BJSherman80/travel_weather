require 'rails_helper'

describe DestinationWeather do
  it 'exists' do
    data = {
      temp: 56,
      weather: [description: 'warm']
    }

    weather = DestinationWeather.new(data)
    expect(weather).to be_a(DestinationWeather)
    expect(weather.temperature).to eq(56)
    expect(weather.summary).to eq('warm')
  end
end
