class Unit < ApplicationRecord
  belongs_to :unit_type 
  
  def unit_type_name 
    unit_type.name 
  end

end
