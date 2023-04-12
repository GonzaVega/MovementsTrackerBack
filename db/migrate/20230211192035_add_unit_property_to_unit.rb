class AddUnitPropertyToUnit < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :is_private, :boolean
  end
end
