module Api
  module Auth
    class PasswordsController < DeviseTokenAuth::PasswordsController
      skip_before_action :verify_authenticity_token
      before_action :configure_permitted_parameters, if: :devise_controller?

      def edit        
        params.permit(:config, :redirect_url, :reset_password_token)        
      end
 
      protected
      
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:accout_update, keys: [:password, :email, :redirect_url])
      end
    end
  end
end
