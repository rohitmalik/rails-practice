class CreateAdvisors < ActiveRecord::Migration[8.0]
  def change
    create_table :advisors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :firm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
