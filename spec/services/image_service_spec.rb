require 'rails_helper'

describe 'image service' do
  it 'can get image data' do
    location = 'phoenix, az'
    data = ImageService.fetch_image(location)

    expect(data).to be_a Hash
    expect(data).to have_key(:results)
    results = data[:results]
    expect(results).to be_a Array
    result = data[:results][0]
    expect(result).to have_key(:id)
    expect(result[:id]).to be_a String
    expect(result).to have_key(:created_at)
    expect(result[:created_at]).to be_a String
    expect(result).to have_key(:updated_at)
    expect(result[:updated_at]).to be_a String
    expect(result).to have_key(:promoted_at)
    expect(result[:promoted_at]).to be_a(String).or eq(nil)
    expect(result).to have_key(:width)
    expect(result[:width]).to be_a(Integer).or be_a(Float)
    expect(result).to have_key(:height)
    expect(result[:height]).to be_a(Integer).or be_a(Float)
    expect(result).to have_key(:color)
    expect(result[:color]).to be_a String
    expect(result).to have_key(:blur_hash)
    expect(result[:blur_hash]).to be_a String
    expect(result).to have_key(:description)
    expect(result[:description]).to be_a String
    expect(result).to have_key(:alt_description)
    expect(result[:alt_description]).to be_a String
    expect(result).to have_key(:urls)
    expect(result[:urls]).to be_a Hash
    expect(result[:urls]).to have_key(:raw)
    expect(result[:urls][:raw]).to be_a String
    expect(result[:urls]).to have_key(:full)
    expect(result[:urls][:full]).to be_a String
    expect(result[:urls]).to have_key(:regular)
    expect(result[:urls][:regular]).to be_a String
    expect(result[:urls]).to have_key(:small)
    expect(result[:urls][:small]).to be_a String
    expect(result[:urls]).to have_key(:thumb)
    expect(result[:urls][:thumb]).to be_a String
    expect(result).to have_key(:links)
    expect(result[:links]).to be_a Hash
    expect(result[:links]).to have_key(:self)
    expect(result[:links][:self]).to be_a String
    expect(result[:links]).to have_key(:html)
    expect(result[:links][:html]).to be_a String
    expect(result[:links]).to have_key(:download)
    expect(result[:links][:download]).to be_a String
    expect(result[:links]).to have_key(:download_location)
    expect(result[:links][:download_location]).to be_a String
    expect(result).to have_key(:categories)
    expect(result[:categories]).to be_a Array
    expect(result).to have_key(:likes)
    expect(result[:likes]).to be_a Integer
    expect(result).to have_key(:liked_by_user)
    expect(result[:liked_by_user]).to be(true).or be(false)
    expect(result).to have_key(:current_user_collections)
    expect(result[:current_user_collections]).to be_a Array
    expect(result).to have_key(:sponsorship)
    expect(result[:sponsorship]).to be_a(String).or eq(nil)
    expect(result).to have_key(:user)
    expect(result[:user]).to be_a Hash
    expect(result[:user]).to have_key(:id)
    expect(result[:user][:id]).to be_a String
    expect(result[:user]).to have_key(:updated_at)
    expect(result[:user][:updated_at]).to be_a String
    expect(result[:user]).to have_key(:username)
    expect(result[:user][:username]).to be_a String
    expect(result[:user]).to have_key(:name)
    expect(result[:user][:name]).to be_a String
    expect(result[:user]).to have_key(:first_name)
    expect(result[:user][:first_name]).to be_a String
    expect(result[:user]).to have_key(:last_name)
    expect(result[:user][:last_name]).to be_a String
    expect(result[:user]).to have_key(:twitter_username)
    expect(result[:user][:twitter_username]).to be_a(String).or eq(nil)
    expect(result[:user]).to have_key(:portfolio_url)
    expect(result[:user][:portfolio_url]).to be_a(String).or eq(nil)
    expect(result[:user]).to have_key(:bio)
    expect(result[:user][:bio]).to be_a(String).or eq(nil)
    expect(result[:user]).to have_key(:location)
    expect(result[:user][:location]).to be_a(String).or eq(nil)
    expect(result[:user]).to have_key(:links)
    expect(result[:user][:links]).to be_a(Hash)
    expect(result[:user][:links]).to have_key(:self)
    expect(result[:user][:links][:self]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:html)
    expect(result[:user][:links][:html]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:photos)
    expect(result[:user][:links][:photos]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:likes)
    expect(result[:user][:links][:likes]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:portfolio)
    expect(result[:user][:links][:portfolio]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:following)
    expect(result[:user][:links][:following]).to be_a(String).or eq(nil)
    expect(result[:user][:links]).to have_key(:followers)
    expect(result[:user][:links][:followers]).to be_a(String).or eq(nil)
  end
end
