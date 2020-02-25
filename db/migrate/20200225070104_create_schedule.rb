class CreateSchedule < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.timestamps

      t.references :hospital, foreign_key: true
      t.references :doctor, foreign_key: true
      t.string :day
      t.string :time
    end
  end
end
