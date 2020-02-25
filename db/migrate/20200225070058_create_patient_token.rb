class CreatePatientToken < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_tokens do |t|
      t.timestamps

      t.references :patient, foreign_key: true
      t.string :token
    end
  end
end
