class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        if session[:user_return_to] == nil
            if current_user.is_admin
                reports_path
            else
                user_posts_path(current_user)
            end
        else
            super
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation,:first_name, :last_name, :is_public])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :is_public])
    end

end
