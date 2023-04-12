class AddDefaultToClosedSchedules < ActiveRecord::Migration[7.0]
  def change
    change_column :schedules, :closed, :boolean, default: false
  end
end
