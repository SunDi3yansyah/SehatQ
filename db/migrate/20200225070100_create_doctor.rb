class CreateDoctor < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.timestamps

      t.string :name
      t.string :email
      t.string :phone
    end
  end
end
