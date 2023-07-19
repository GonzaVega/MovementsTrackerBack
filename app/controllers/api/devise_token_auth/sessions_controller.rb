class Api::DeviseTokenAuth::SessionsController < DeviseTokenAuth::SessionsController
 before_action :authenticate_api_user!, only: [:destroy]

 private
 
  def resource_params
    params.permit(:email, :password)
  end

end
