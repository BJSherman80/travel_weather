require 'rails_helper'

describe Destination do
  it 'exists' do
    data = {
      route: { legs: [destNarrative: 'America'], realTime: 60_045 }
    }

    destination = Destination.new(data)
    expect(destination).to be_a(Destination)
    expect(destination.city).to eq('America')
    expect(destination.travel_time).to eq('16 hours 40 minutes 45 seconds')
  end
end
