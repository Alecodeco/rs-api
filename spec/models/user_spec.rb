# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  email                  :string
#  gender                 :string
#  tokens                 :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, :type => :model do
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
