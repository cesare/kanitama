class AddIndexOnActiveFlag < ActiveRecord::Migration
  def up
    add_index :hosts, :active_flag
  end

  def down
    remove_index :hosts, :active_flag
  end
end
