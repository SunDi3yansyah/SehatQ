class CreateBooking < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.timestamps

      t.references :hospital, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :time
    end
  end
end
