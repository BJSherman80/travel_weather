require 'rails_helper'

describe 'munchies facade' do
  it 'returns a munchie trip' do
    location = 'durango, co'
    destination = 'denver, co'
    food = 'american'
    munchie = MunchiesFacade.fetch_data(location, destination, food)

    expect(munchie).to be_a(Munchie)
    expect(munchie.destination).to be_a(Destination)
    expect(munchie.resturant).to be_a(Resturant)
    expect(munchie.current_weather).to be_a(DestinationWeather)
  end
end
