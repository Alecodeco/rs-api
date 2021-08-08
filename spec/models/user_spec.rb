require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is invalid with insufficient attributes" do
    expect(User.new).to be_invalid
  end
  it "is valid with sufficient attributes" do
    test_user = User.new(id: 1, provider: "email", email: "test@test.com", 
                        password: "testing", uid: "test@test.com", gender: "male", 
                        created_at: "01-01-01", updated_at: "01-01-01")
    expect(test_user).to be_valid
  end
  it "is invalid with short password" do
    test_user = User.new(id: 1, provider: "email", email: "test@test.com", 
                        password: "test", uid: "test@test.com", gender: "male", 
                        created_at: "01-01-01", updated_at: "01-01-01")
    expect(test_user).to be_invalid
  end
end