require 'rails_helper'

describe 'Geo Service' do
  it 'can get lat long from input' do
    location = 'phoenix, az'
    search_results = GeoService.fetch_lat_long(location)
    expect(search_results).to be_a Array
    expect(search_results[0]).to be_a Float
    expect(search_results[1]).to be_a Float
  end
  # need to add error response if location[:results][0][:locations][0][:geocodeQuality] != "STATE" || "CITY"
end
