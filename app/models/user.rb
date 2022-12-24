class User < ApplicationRecord
  belongs_to :unit
  
  def unit_name
    unit.name 
  end

end
