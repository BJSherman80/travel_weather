require 'rails_helper'

describe 'Image api' do
  it 'can get correct json from a request' do
    get '/api/v1/backgrounds?location=phoenix,az'
    expect(response).to be_successful

    image = JSON.parse(response.body)

    expect(image['data']).to have_key('id')
    expect(image['data']['id']).to eq(nil)
    expect(image['data']).to have_key('type')
    expect(image['data']['type']).to eq('image')
    expect(image['data']).to have_key('attributes')
    expect(image['data']['attributes']).to be_a Hash
    expect(image['data']['attributes']).to have_key('image')
    expect(image['data']['attributes']['image']).to be_a String
    expect(image['data']['attributes']).to have_key('description')
    expect(image['data']['attributes']['description']).to be_a String
    expect(image['data']['attributes']).to have_key('photographer')
    expect(image['data']['attributes']['photographer']).to be_a String
    expect(image['data']['attributes']).to have_key('credit')
    expect(image['data']['attributes']['credit']).to be_a String
  end
end
