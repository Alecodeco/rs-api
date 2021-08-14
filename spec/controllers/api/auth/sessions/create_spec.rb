require 'rails_helper'

RSpec.describe 'Sign In user via POST', type: :request do
  let!(:user) { create(:user) }

  it "should sign in when given valid user and password" do    
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'testing' }    
    expect(response).to have_http_status(:ok)
  end

  it "should fail when given invalid user" do
    post '/api/auth/users/sign_in', params: { email: 'fail@mail.com', password: 'testing' }
    expect(response).to have_http_status(:unauthorized)
  end

  it "should fail when given invalid password" do
    post '/api/auth/users/sign_in', params: { email: 'test@mail.com', password: 'failing' }
    expect(response).to have_http_status(:unauthorized)
  end
end
