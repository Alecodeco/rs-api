# frozen_string_literal: true

class User < ActiveRecord::Base  
  devise :registerable, :confirmable, :recoverable, :rememberable, 
         :trackable, :validatable,  :database_authenticatable

  include DeviseTokenAuth::Concerns::User
  
  before_validation :set_uid
  
  def set_uid
    self.uid = self.class.generate_uid if self.uid.blank?
  end

  def self.generate_uid
    loop do
      token = Devise.friendly_token
      break token unless to_adapter.find_first({ uid: token })
    end
  end
end
