require 'rails_helper'

RSpec.describe 'Sign Up user via POST', type: :request do
  it "should create User when given valid email, gender, password and password confirmation" do
    expect {
      post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'testing', gender: 'male' } }
    }.to change { User.count }.by(1)

    expect(response).to have_http_status(:ok)
  end

  it "should fail when given less-than-8-characters password" do
    post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'test', gender: 'male' } }

    expect(response).to have_http_status(:unprocessable_entity)
  end
end

RSpec.describe 'Sign In user via POST', type: :request do
  it "should sign in when given valid user and password" do
    post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'testing', gender: 'male' } }
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'testing' }

    expect(response).to have_http_status(:ok)
  end

  it "should fail when given invalid user" do
    post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'testing', gender: 'male' } }    
    post '/api/auth/users/sign_in', params: { email: 'fail@mail.com', password: 'testing' }

    expect(response).to have_http_status(:unauthorized)
  end

  it "should fail when given invalid password" do
    post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'testing', gender: 'male' } }    
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'failing' }

    expect(response).to have_http_status(:unauthorized)
  end
end

RSpec.describe 'Sign Out user via DELETE', type: :request do
  it "should sign out when given user credentials and session client, iud and access-token" do
    post '/api/auth/users', params: { user: { email: 'test@mail.com', password: 'testing', password_confirmation: 'testing', gender: 'male' } }    
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'testing' } 

    token  = response.header["access-token"]
    client = response.header["client"]
    
    data = JSON.parse(response.body.to_s)
    uid = data["data"]["uid"]
    
    delete '/api/auth/users/sign_out', params: {  email: 'test@mail.com', 
                                                  password: 'testing',
                                                  'access-token' => token,
                                                  'client'       => client,
                                                  'uid'          => uid 
                                                }
    expect(response).to have_http_status(:ok)
  end
end