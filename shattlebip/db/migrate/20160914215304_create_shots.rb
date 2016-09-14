class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :board_id
      t.integer :target_index

      t.timestamps null: false
    end
  end
end
