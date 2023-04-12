class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer :day
      t.boolean :closed
      t.datetime :opening
      t.datetime :closing
      t.datetime :midday_closing
      t.datetime :midday_opening
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
