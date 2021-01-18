require 'rails_helper'

describe 'image facade' do
  it 'returns a image' do
    location = 'phoenix, az'
    image = ImageFacade.fetch_image(location)

    expect(image).to be_a(Image)
  end
end
