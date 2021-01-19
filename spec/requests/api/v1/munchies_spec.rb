require 'rails_helper'

describe 'Munchies api' do
  it 'can get correct json from a request' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
    expect(response).to be_successful

    data = JSON.parse(response.body)
  end
end
