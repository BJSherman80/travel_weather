require 'rails_helper'

describe Resturant do
  it 'exists' do
    data = {
      businesses: [{ name: 'Taco Bell', location: { display_address: '1234 west' } }]
    }

    resturant = Resturant.new(data)
    expect(resturant).to be_a(Resturant)
    expect(resturant.name).to eq('Taco Bell')
    expect(resturant.address).to eq('1234 west')
  end
end
