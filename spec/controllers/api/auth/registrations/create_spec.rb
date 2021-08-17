require 'rails_helper'

RSpec.describe 'Sign Up user via POST', type: :request do  
  it "should succeed when given valid email, gender, password and password confirmation" do
    expect {
      post '/api/auth/users', params: { 
        user: { 
          email: 'test@mail.com', 
          password: 'testing', 
          password_confirmation: 'testing', 
          gender: 'male' 
        } 
      }
    }.to change { User.count }.by(1)

    expect(response).to have_http_status(:ok)
  end

  it "should fail when given less-than-8-characters password" do
    expect {
      post '/api/auth/users', params: { 
        user: { 
          email: 'test@mail.com', 
          password: 'test', 
          password_confirmation: 'test', 
          gender: 'male' 
        } 
      }
    }.to change { User.count }.by(0)

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
