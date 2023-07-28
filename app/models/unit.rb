class Unit < ApplicationRecord
  belongs_to :unit_type 
  has_many :users
  has_many :movements
  
  def unit_type_name 
    unit_type.name 
  end

end
