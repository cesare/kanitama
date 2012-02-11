class ChangeProcessorMaxSpeedToString < ActiveRecord::Migration
  def up
    change_column :processors, :processor_max_speed, :string
  end

  def down
    change_column :processors, :processor_max_speed, :integer
  end
end
