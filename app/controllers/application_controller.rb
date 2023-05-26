class ApplicationController < ActionController::Base
        before_action :configured_permitted_parameters, if: :devise_controller?
        include DeviseTokenAuth::Concerns::SetUserByToken

        def configured_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :unit_id, :password])
        end
end
