class Unit < ApplicationRecord
  belongs_to :unit_type 
  has_many :users
  
  def unit_type_name 
    unit_type.name 
  end

end
