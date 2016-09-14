class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :length
      t.integer :bow_index
      t.integer :stern_index
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
