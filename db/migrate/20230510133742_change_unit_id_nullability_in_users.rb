class ChangeUnitIdNullabilityInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :unit_id, true
  end
end
