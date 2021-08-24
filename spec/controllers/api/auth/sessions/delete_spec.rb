require 'rails_helper'

RSpec.describe 'Sign Out user via DELETE', type: :request do
  let!(:user) { create(:user) }

  it "should succeed when given user credentials and session client, iud and access-token" do    
    user_signed_in = user.create_new_auth_token
    
    delete '/api/auth/users/sign_out', params: {  
      email: 'test@mail.com', 
      password: 'testing', 
      'access-token' => user_signed_in['access-token'], 
      'client'       => user_signed_in['client'], 
      'uid'          => user_signed_in['uid'] 
    }
    
    expect(response).to have_http_status(:ok)
  end
end
