class AddTokensToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tokens, :text
    # al cambiar base de datos a produccion, cambiar el tipo de dato de tokens a :json
  end
end
