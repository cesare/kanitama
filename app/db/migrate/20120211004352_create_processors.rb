class CreateProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|
      t.integer :host_id
      t.string :processor_family
      t.string :processor_version
      t.string :processor_signature
      t.string :processor_manufacturer
      t.integer :processor_max_speed
      t.string :processor_id
      t.integer :processor_core_count
      t.integer :processor_core_enabled

      t.timestamps
    end
  end
end
