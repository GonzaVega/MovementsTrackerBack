class User < ApplicationRecord
            # Include default devise modules.
            include DeviseTokenAuth::Concerns::User
            # devise :registerable, :recoverable, :confirmable
 

  belongs_to :unit, optional: true
  
  def unit_name
    unit.name 
  end

end
