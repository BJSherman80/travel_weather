require 'rails_helper'

describe 'Munchies api' do
  it 'can get correct json from a request' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    expect(response).to be_successful

    weather = JSON.parse(response.body)
    binding.pry
  end
end
