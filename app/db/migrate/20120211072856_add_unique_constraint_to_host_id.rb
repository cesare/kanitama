class AddUniqueConstraintToHostId < ActiveRecord::Migration
  def up
    change_column :baseboards, :host_id, :integer, :null => false
    change_column :bioses, :host_id, :integer, :null => false
    change_column :processors, :host_id, :integer, :null => false

    add_index :baseboards, :host_id, :unique => true
    add_index :bioses, :host_id, :unique => true
    add_index :processors, :host_id, :unique => true
  end

  def down
    change_column :baseboards, :host_id, :integer, :null => true
    change_column :bioses, :host_id, :integer, :null => true
    change_column :processors, :host_id, :integer, :null => true

    remove_index :baseboards, :host_id
    remove_index :bioses, :host_id
    remove_index :processors, :host_id
  end
end
