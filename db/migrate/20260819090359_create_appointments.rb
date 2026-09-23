class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :advisor, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.datetime :appointment_date
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
