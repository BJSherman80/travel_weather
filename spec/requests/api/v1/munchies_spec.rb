require 'rails_helper'

describe 'Munchies api' do
  it 'can get correct json from a request' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
    expect(response).to be_successful

    munchie_data = JSON.parse(response.body)

    expect(munchie_data['data']).to have_key('id')
    expect(munchie_data['data']['id']).to eq(nil)
    expect(munchie_data['data']).to have_key('type')
    expect(munchie_data['data']['type']).to eq('munchie')
    expect(munchie_data['data']).to have_key('attributes')
    expect(munchie_data['data']['attributes']).to be_a Hash
    expect(munchie_data['data']['attributes']).to have_key('destination')
    expect(munchie_data['data']['attributes']['destination']).to be_a Hash
    expect(munchie_data['data']['attributes']['destination']).to have_key('city')
    expect(munchie_data['data']['attributes']['destination']['city']).to be_a String
    expect(munchie_data['data']['attributes']['destination']).to have_key('travel_time')
    expect(munchie_data['data']['attributes']['destination']['travel_time']).to be_a String
    expect(munchie_data['data']['attributes']).to have_key('current_weather')
    expect(munchie_data['data']['attributes']['current_weather']).to be_a Hash
    expect(munchie_data['data']['attributes']['current_weather']).to have_key('temperature')
    expect(munchie_data['data']['attributes']['current_weather']['temperature']).to be_a(Integer).or be_a(Float)
    expect(munchie_data['data']['attributes']['current_weather']).to have_key('summary')
    expect(munchie_data['data']['attributes']['current_weather']['summary']).to be_a String
    expect(munchie_data['data']['attributes']).to have_key('resturant')
    expect(munchie_data['data']['attributes']['resturant']).to be_a Hash
    expect(munchie_data['data']['attributes']['resturant']).to have_key('name')
    expect(munchie_data['data']['attributes']['resturant']['name']).to be_a String
    expect(munchie_data['data']['attributes']['resturant']).to have_key('address')
    expect(munchie_data['data']['attributes']['resturant']['address']).to be_a Array
    expect(munchie_data['data']['attributes']['resturant']['address'][0]).to be_a String
    expect(munchie_data['data']['attributes']['resturant']['address'][1]).to be_a String
  end
end
