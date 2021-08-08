module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      skip_before_action :verify_authenticity_token
      wrap_parameters User, include: [:email, :password, :password_confirmation, :gender]

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :gender)
      end

      def account_update_params
        params.require(:user).permit(:email, :gender, :password)
      end
    end
  end
end
