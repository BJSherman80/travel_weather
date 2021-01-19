require 'rails_helper'

describe 'as a user' do
  it 'can login' do
    User.create!(email: 'bjsherman80@gmail.com', password: 'password', password_confirmation: 'password')
    user_params = { email: 'bjsherman80@gmail.com', password: 'password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to be_a Hash
    data = response_body[:data]
    expect(data).to have_key(:id)
    expect(data[:id]).to be_a String
    expect(data).to have_key(:type)
    expect(data[:type]).to be_a String
    expect(data[:type]).to eq('users')
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a Hash
    attributes = data[:attributes]
    expect(attributes).to have_key(:email)
    expect(attributes[:email]).to be_a String
    expect(attributes).to have_key(:api_key)
    expect(attributes[:api_key]).to be_a String
  end

  it 'can get a 400 error when empty email' do
    User.create!(email: 'bjsherman80@gmail.com', password: 'password', password_confirmation: 'password')
    user_params = { email: '', password: 'password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to be_a Hash
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to be_a String
    expect(response_body[:errors]).to eq('There was an error with your E-Mail/Password combination. Please try again.')
  end

  it 'can get a 400 error when empty password' do
    User.create!(email: 'bjsherman80@gmail.com', password: 'password', password_confirmation: 'password')
    user_params = { email: 'bjsherman80@gmail.com', password: '' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to be_a Hash
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to be_a String
    expect(response_body[:errors]).to eq('There was an error with your E-Mail/Password combination. Please try again.')
  end
end
