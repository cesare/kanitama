class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :baseboard_id
      t.string :memory_size
      t.string :memory_speed
      t.string :memory_type

      t.timestamps
    end
  end
end
