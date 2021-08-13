require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is invalid when given insufficient attributes" do
    expect(User.new(id:1, email: 'test@mail.com')).to be_invalid
  end

  it "is invalid when given less-than-8-characters password" do
    test_user = User.new(id: 1, 
                         provider: "email", 
                         email: "test@test.com", 
                         password: "test", 
                         uid: "test@test.com", 
                         gender: "male", 
                         created_at: "01-01-01", 
                         updated_at: "01-01-01")

      expect(test_user).to be_invalid
    end

    it "is valid when given enough attributes" do
      test_user = User.new(id: 1, 
                           provider: "email", 
                           email: "test@test.com", 
                           password: "testing", 
                           uid: "test@test.com", 
                           gender: "male", 
                           created_at: "01-01-01", 
                           updated_at: "01-01-01")

      expect(test_user).to be_valid
    end
end
