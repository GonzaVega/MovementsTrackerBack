class ApplicationController < ActionController::Base
        protect_from_forgery with: :null_session
        before_action :authenticate_api_user!
        before_action :configured_permitted_parameters, if: :devise_controller?
        include DeviseTokenAuth::Concerns::SetUserByToken

        def configured_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :unit_id, :password, :email])
        end
end
