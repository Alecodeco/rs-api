module Api  
  class TopicsController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_api_user!

    def index
      @topics = Topic.all
    end
  end
end  
  
