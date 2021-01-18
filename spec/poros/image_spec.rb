require 'rails_helper'

describe Image do
  it 'exists' do
    data = {
      results: [{ urls: { regular: 'image url' }, description: 'photo', user: { links: { html: 'user url' } } }]
    }

    image = Image.new(data)
    expect(image).to be_a(Image)
    expect(image.image).to eq('image url')
    expect(image.description).to eq('photo')
    expect(image.photographer).to eq('user url')
    expect(image.credit).to eq('Credit to Unsplash.com')
  end
end
