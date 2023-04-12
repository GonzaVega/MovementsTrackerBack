class CreateJoinTableUsersUnits < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :units do |t|
      # t.index [:user_id, :unit_id]
      # t.index [:unit_id, :user_id]
    end
  end
end
