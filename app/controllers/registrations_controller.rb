class RegistrationsController < Devise::RegistrationsController

    private
  
      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar)
      end

      def account_update_params
        params.require(:user).permit(:email, :password, :current_password, :password_confirmation, :name, :avatar)
      end
  end