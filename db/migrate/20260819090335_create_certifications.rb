class CreateCertifications < ActiveRecord::Migration[8.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :issuing_organization

      t.timestamps
    end
  end
end
