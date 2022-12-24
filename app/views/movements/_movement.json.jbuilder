# json.extract! movement, :id, :amount, :concept, :description, :date, :unit_id, :user_id, :created_at, :updated_at
json.id movement.id 
json.amount movement.amount

if movement.concept == 1
json.concept 'income'
elsif movement.concept == 2
  json.concept 'expense'
end

json.description movement.description 
json.date movement.date 
json.unit movement.unit.name 
json.user movement.user.name 
json.url movement_url(movement, format: :json)
