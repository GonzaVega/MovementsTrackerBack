class Movement < ApplicationRecord
  belongs_to :unit
  belongs_to :user
  
  def unit_name
    unit.name 
  end
  
  def user_name
    user.name 
  end

end
