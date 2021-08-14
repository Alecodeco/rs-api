require 'rails_helper'

RSpec.describe 'Sign Out user via DELETE', type: :request do
  let!(:user) { create(:user) }

  it "should sign out when given user credentials and session client, iud and access-token" do    
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'testing' }    

    token  = response.header["access-token"]
    client = response.header["client"]
    
    data = JSON.parse(response.body.to_s)
    uid = data["data"]["uid"]
    
    delete '/api/auth/users/sign_out', params: {  
      email: 'test@mail.com', 
      password: 'testing', 
      'access-token' => token, 
      'client'       => client, 
      'uid'          => uid 
    }
    
    expect(response).to have_http_status(:ok)
  end
end
