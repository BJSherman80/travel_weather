require 'rails_helper'

describe 'User' do
  it 'can regiter as a new user' do
    user_params = { email: 'user@google.com', password: 'password', password_confirmation: 'password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    expect(response).to be_successful
    expect(response.status).to eq(201)
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

  it 'can get a 400 error with empty email message' do
    user_params = { email: '', password: 'password', password_confirmation: 'password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to be_a Hash
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to be_a String
    expect(response_body[:errors]).to eq("Email can't be blank")
  end

  it 'can get a 400 error with empty password message' do
    user_params = { email: 'user@google.com', password: '', password_confirmation: 'password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to be_a Hash
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to be_a String
    expect(response_body[:errors]).to eq("Password can't be blank")
  end

  it 'can get a 409 error with not matching passwords message' do
    user_params = { email: 'user@google.com', password: 'password', password_confirmation: 'wrong_password' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
    expect(response).not_to be_successful
    expect(response.status).to eq(409)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to be_a Hash
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to be_a String
    expect(response_body[:errors]).to eq('The password confirmation does not match.')
  end
end
