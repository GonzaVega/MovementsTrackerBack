# json.extract! unit, :id, :name, :address, :unit_type_name, :created_at, :updated_at

json.id unit.id 
json.name unit.name 
json.address unit.address 
json.unit_type_name unit.unit_type_name
json.created_at unit.created_at 
json.updated_at unit.updated_at

json.url unit_url(unit, format: :json)
