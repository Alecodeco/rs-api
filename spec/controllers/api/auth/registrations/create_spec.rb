require 'rails_helper'

RSpec.describe 'Sign Up user via POST', type: :request do  
  valid_params = {
    user: {
      gender:   'male',
      email:    'test@mail.com',
      password: 'testing',
      password_confirmation: 'testing'
    }
  }

  invalid_params = {
    user: {
      gender:   'male',
      email:    'test@mail.com',
      password: 'bad',
      password_confirmation: 'bad'
    }
  }

  it "should succeed when given valid email, gender, password and password confirmation" do
    expect {
      post '/api/auth/users', :params => valid_params
    }.to change { User.count }.by(1)

    expect(response).to have_http_status(:ok)
  end

  it "should fail when given less-than-8-characters password" do    
    expect {
      post '/api/auth/users', :params => invalid_params
    }.to change { User.count }.by(0)

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
