class CreateHospital < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.timestamps

      t.string :name
      t.string :address
    end
  end
end
