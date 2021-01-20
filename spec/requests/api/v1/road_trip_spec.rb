require 'rails_helper'

describe 'roadtrip request' do
  it 'can get correct json from a request' do
    user = User.create!(email: 'bjsherman80@gmail.com', password: 'password', password_confirmation: 'password')
    request = {

      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/roadtrip', headers: headers, params: JSON.generate(request)

    response_json = JSON.parse(response.body)
    expect(response_json).to have_key('data')
    expect(response_json['data']).to be_a Hash
    expect(response_json['data']).to have_key('id')
    expect(response_json['data']['id']).to eq(nil)
    expect(response_json['data']).to have_key('type')
    expect(response_json['data']['type']).to eq('road_trip')
    expect(response_json['data']).to have_key('attributes')
    expect(response_json['data']['attributes']).to be_a Hash
    expect(response_json['data']['attributes']).to have_key('location')
    expect(response_json['data']['attributes']['location']).to be_a String
    expect(response_json['data']['attributes']).to have_key('destination')
    expect(response_json['data']['attributes']['destination']).to be_a String
    expect(response_json['data']['attributes']).to have_key('travel_time')
    expect(response_json['data']['attributes']['travel_time']).to be_a String
    expect(response_json['data']['attributes']).to have_key('arrival_forecast')
    expect(response_json['data']['attributes']['arrival_forecast']).to be_a Hash
    expect(response_json['data']['attributes']['arrival_forecast']).to have_key('temperature')
    expect(response_json['data']['attributes']['arrival_forecast']['temperature']).to be_a(Integer).or be_a(Float)
    expect(response_json['data']['attributes']['arrival_forecast']).to have_key('conditions')
    expect(response_json['data']['attributes']['arrival_forecast']['conditions']).to be_a String
  end
end
