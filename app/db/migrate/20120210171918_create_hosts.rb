class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :ipaddress, :null => false
      t.string :name, :null => false

      t.timestamps
    end
    add_index :hosts, [:ipaddress, :name]
  end
end
