class AddActiveFlagToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :active_flag, :boolean
  end
end
