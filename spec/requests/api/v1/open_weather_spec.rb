require 'rails_helper'

describe 'Forcast api' do
  it 'can get json through open weather api' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    weather = JSON.parse(response.body)
    binding.pry
    expect(weather[:data]).to have_key(:id)
    expect(weather[:data][:id]).to eq(nil)
    expect(weather[:data]).to have_key(:attributes)
    expect(weather[:type]).to eq('forcast')
  end
end
