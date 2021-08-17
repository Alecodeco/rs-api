require 'rails_helper'

RSpec.describe User, :focus, :type => :model do
  it "is invalid when given less-than-8-characters password" do
    expect{
      create(:user, password: "test", password_confirmation: "test")
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

    it "is valid when given valid attributes" do
      expect {
        create(:user)
      }.to change { User.count }.by(1)     
    end
end
