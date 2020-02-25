class CreatePatient < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.timestamps

      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.boolean :active
    end
  end
end
