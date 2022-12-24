class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.integer :amount
      t.integer :concept
      t.string :description
      t.timestamp :date
      t.belongs_to :unit, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
