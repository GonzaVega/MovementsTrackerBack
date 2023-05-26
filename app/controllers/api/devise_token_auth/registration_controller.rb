# class Api::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
#   private

#   def sign_up_params
#     params.permit(:email, :password, :password_confirmation, :name, :unit_id)
#   end

#   def account_update_params
#     params.permit(:email, :name, :unit_id)
#   end
# end

class Api::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name, :unit_id)
  end

  def account_update_params
    params.permit(:email, :name, :unit_id)
  end

  def create
    super do |resource|
      resource.unit_id = params[:unit_id]
    end
  end
end
