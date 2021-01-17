require 'rails_helper'

describe DailyWeather do
  it 'exists' do
    data = {
      dt: 1_610_910_000,
      sunrise: 1_610_893_087,
      sunset: 1_610_928_108,
      temp: { max: 90.0, min: 60.5 },
      weather: [{ description: 'windy', icon: '04g' }]
    }

    weather = DailyWeather.new(data)
    expect(weather).to be_a(DailyWeather)
    expect(weather.date).to eq('2021-01-17 12:00:00 -0700')
    expect(weather.sunrise).to eq('2021-01-17 07:18:07 -0700')
    expect(weather.sunset).to eq('2021-01-17 07:18:07 -0700')
    expect(weather.max_temp).to eq(90.00)
    expect(weather.min_temp).to eq(60.5)
    expect(weather.conditions).to eq('windy')
    expect(weather.icon).to eq('04g')
  end
end
