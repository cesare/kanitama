class CreateBaseboards < ActiveRecord::Migration
  def change
    create_table :baseboards do |t|
      t.integer :host_id
      t.string :baseboard_product_name
      t.string :baseboard_serial_number
      t.string :baseboard_version
      t.string :baseboard_description
      t.string :system_uuid
      t.string :memory_maximum_capacity
      t.integer :memory_number_of_devices

      t.timestamps
    end
  end
end
