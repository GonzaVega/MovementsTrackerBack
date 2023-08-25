class Api::DeviseTokenAuth::SessionsController < DeviseTokenAuth::SessionsController
 before_action :authenticate_api_user!, only: [:destroy]

 def create
  # Lógica de inicio de sesión existente
  super
  response.headers.merge!({
    'access-token' => @token,
    'client' => @client_id,
    'uid' => @resource.uid,
    'name' => @resource.name
  })

  
 
end

 private
 
  def resource_params
    params.permit(:email, :password)
  end

end
