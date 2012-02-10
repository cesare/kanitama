class CreateBioses < ActiveRecord::Migration
  def change
    create_table :bioses do |t|
      t.integer :host_id
      t.date :bios_release_date
      t.string :bios_vendor
      t.string :bios_version

      t.timestamps
    end
  end
end
