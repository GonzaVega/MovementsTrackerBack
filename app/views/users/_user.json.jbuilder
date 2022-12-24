# json.extract! user, :id, :email, :password, :name, :unit_id, :created_at, :updated_at

json.id user.id 
json.name user.name
json.email user.email 
json.password user.password
json.unit_id user.unit.name 
json.created_at user.created_at
json.updated_at user.updated_at 
json.url user_url(user, format: :json)
