require 'rails_helper'

describe 'Yelp Service' do
  it 'can get resturant data in city' do
    food = 'mexican'
    destination = 'phoenix, az'
    yelp_data = YelpService.fetch_resturants(food, destination)
    expect(yelp_data).to be_a Hash
    expect(yelp_data).to have_key(:businesses)
    expect(yelp_data[:businesses]).to be_a Array
    resturant = yelp_data[:businesses][0]
    expect(resturant).to have_key(:id)
    expect(resturant[:id]).to be_a String
    expect(resturant).to have_key(:alias)
    expect(resturant[:alias]).to be_a String
    expect(resturant).to have_key(:name)
    expect(resturant[:name]).to be_a String
    expect(resturant).to have_key(:image_url)
    expect(resturant[:image_url]).to be_a String
    expect(resturant).to have_key(:is_closed)
    expect(resturant[:is_closed]).to be(true).or be(false)
    expect(resturant).to have_key(:url)
    expect(resturant[:url]).to be_a String
    expect(resturant).to have_key(:review_count)
    expect(resturant[:review_count]).to be_a Integer
    expect(resturant).to have_key(:categories)
    expect(resturant[:categories]).to be_a Array
    expect(resturant[:categories][0]).to have_key(:alias)
    expect(resturant[:categories][0][:alias]).to be_a String
    expect(resturant[:categories][0]).to have_key(:title)
    expect(resturant[:categories][0][:title]).to be_a String
    expect(resturant).to have_key(:rating)
    expect(resturant[:rating]).to be_a(Integer).or be_a(Float)
    expect(resturant).to have_key(:coordinates)
    expect(resturant[:coordinates]).to be_a Hash
    expect(resturant[:coordinates]).to have_key(:latitude)
    expect(resturant[:coordinates][:latitude]).to be_a(Integer).or be_a(Float)
    expect(resturant[:coordinates]).to have_key(:longitude)
    expect(resturant[:coordinates][:longitude]).to be_a(Integer).or be_a(Float)
    expect(resturant).to have_key(:transactions)
    expect(resturant[:transactions]).to be_a Array
    expect(resturant[:transactions][0]).to be_a String
    expect(resturant[:transactions][1]).to be_a String
    expect(resturant).to have_key(:price)
    expect(resturant[:price]).to be_a String
    expect(resturant[:location]).to be_a Hash
    expect(resturant[:location]).to have_key(:address1)
    expect(resturant[:location][:address1]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:address2)
    expect(resturant[:location][:address2]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:address3)
    expect(resturant[:location][:address3]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:city)
    expect(resturant[:location][:city]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:zip_code)
    expect(resturant[:location][:zip_code]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:country)
    expect(resturant[:location][:country]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:state)
    expect(resturant[:location][:state]).to be_a(String).or eq(nil)
    expect(resturant[:location]).to have_key(:display_address)
    expect(resturant[:location][:display_address]).to be_a Array
    expect(resturant[:location][:display_address][0]).to be_a String
    expect(resturant[:location][:display_address][1]).to be_a String
    expect(resturant).to have_key(:phone)
    expect(resturant[:phone]).to be_a String
    expect(resturant).to have_key(:display_phone)
    expect(resturant[:display_phone]).to be_a String
    expect(resturant).to have_key(:distance)
    expect(resturant[:distance]).to be_a(Integer).or be_a(Float)
  end
end
