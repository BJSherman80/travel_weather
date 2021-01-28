require 'rails_helper'

describe 'Forcast request' do
  it 'can get correct json from a request' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    weather = JSON.parse(response.body)

    expect(weather['data']).to have_key('id')
    expect(weather['data']['id']).to eq(nil)
    expect(weather['data']).to have_key('type')
    expect(weather['data']['type']).to eq('forecast')
    expect(weather['data']).to have_key('attributes')
    expect(weather['data']['attributes']).to be_a Hash
    # current weather
    expect(weather['data']['attributes']).to have_key('current_weather')
    expect(weather['data']['attributes']['current_weather']).to be_a Hash
    expect(weather['data']['attributes']['current_weather']).to have_key('datetime')
    expect(weather['data']['attributes']['current_weather']['datetime']).to be_a String
    expect(weather['data']['attributes']['current_weather']).to have_key('sunrise')
    expect(weather['data']['attributes']['current_weather']['sunrise']).to be_a String
    expect(weather['data']['attributes']['current_weather']).to have_key('sunset')
    expect(weather['data']['attributes']['current_weather']['sunset']).to be_a String
    expect(weather['data']['attributes']['current_weather']).to have_key('temperature')
    expect(weather['data']['attributes']['current_weather']['temperature']).to be_a Float
    expect(weather['data']['attributes']['current_weather']).to have_key('feels_like')
    expect(weather['data']['attributes']['current_weather']['feels_like']).to be_a Float
    expect(weather['data']['attributes']['current_weather']).to have_key('humidity')
    expect(weather['data']['attributes']['current_weather']['humidity']).to be_a(Integer).or be_a(Float)
    expect(weather['data']['attributes']['current_weather']).to have_key('uvi')
    expect(weather['data']['attributes']['current_weather']['uvi']).to be_a(Integer).or be_a(Float)
    expect(weather['data']['attributes']['current_weather']).to have_key('visibility')
    expect(weather['data']['attributes']['current_weather']['visibility']).to be_a(Integer).or be_a(Float)
    expect(weather['data']['attributes']['current_weather']).to have_key('conditions')
    expect(weather['data']['attributes']['current_weather']['conditions']).to be_a String
    expect(weather['data']['attributes']['current_weather']).to have_key('icon')
    expect(weather['data']['attributes']['current_weather']['icon']).to be_a String
    # daily weather
    expect(weather['data']['attributes']).to have_key('daily_weather')
    expect(weather['data']['attributes']['daily_weather']).to be_a Array
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('date')
    expect(weather['data']['attributes']['daily_weather'][0]['date']).to be_a String
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('sunset')
    expect(weather['data']['attributes']['daily_weather'][0]['sunset']).to be_a String
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('sunrise')
    expect(weather['data']['attributes']['daily_weather'][0]['sunrise']).to be_a String
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('max_temp')
    expect(weather['data']['attributes']['daily_weather'][0]['max_temp']).to be_a Float
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('min_temp')
    expect(weather['data']['attributes']['daily_weather'][0]['min_temp']).to be_a Float
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('conditions')
    expect(weather['data']['attributes']['daily_weather'][0]['conditions']).to be_a String
    expect(weather['data']['attributes']['daily_weather'][0]).to have_key('icon')
    expect(weather['data']['attributes']['daily_weather'][0]['icon']).to be_a String
    # hourly weather
    expect(weather['data']['attributes']).to have_key('hourly_weather')
    expect(weather['data']['attributes']['hourly_weather']).to be_a Array
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('time')
    expect(weather['data']['attributes']['hourly_weather'][0]['time']).to be_a String
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('temperature')
    expect(weather['data']['attributes']['hourly_weather'][0]['temperature']).to be_a Float
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('wind_speed')
    expect(weather['data']['attributes']['hourly_weather'][0]['wind_speed']).to be_a Float
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('wind_direction')
    expect(weather['data']['attributes']['hourly_weather'][0]['wind_direction']).to be_a String
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('conditions')
    expect(weather['data']['attributes']['hourly_weather'][0]['conditions']).to be_a String
    expect(weather['data']['attributes']['hourly_weather'][0]).to have_key('icon')
    expect(weather['data']['attributes']['hourly_weather'][0]['icon']).to be_a String
  end

  it 'does not use this json from request' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    weather = JSON.parse(response.body)
    # current
    expect(weather['data']['attributes']['current_weather']).to_not have_key('pressure')
    expect(weather['data']['attributes']['current_weather']).to_not have_key('dew_point')
    expect(weather['data']['attributes']['current_weather']).to_not have_key('clouds')
    expect(weather['data']['attributes']['current_weather']).to_not have_key('wind_speed')
    expect(weather['data']['attributes']['current_weather']).to_not have_key('wind_direction')
    # daily
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('feels_like')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('pressure')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('humidity')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('dew_point')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('wind_speed')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('wind_direction')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('uvi')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('clouds')
    expect(weather['data']['attributes']['daily_weather'][0]).to_not have_key('pop')
    # hourly
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('pressure')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('feels_like')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('humidity')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('dew_point')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('uvi')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('clouds')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('visibility')
    expect(weather['data']['attributes']['hourly_weather'][0]).to_not have_key('pop')
  end

  it 'can gets 5 day daily forcast and 8 hour hourly forecast' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    weather = JSON.parse(response.body)
    expect((weather['data']['attributes']['hourly_weather']).length).to eq(8)
    expect((weather['data']['attributes']['daily_weather']).length).to eq(5)
  end
end
