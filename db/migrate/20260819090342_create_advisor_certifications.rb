class CreateAdvisorCertifications < ActiveRecord::Migration[8.0]
  def change
    create_table :advisor_certifications do |t|
      t.references :advisor, null: false, foreign_key: true
      t.references :certification, null: false, foreign_key: true
      t.date :issued_at

      t.timestamps
    end
  end
end
