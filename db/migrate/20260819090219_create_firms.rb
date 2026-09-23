class CreateFirms < ActiveRecord::Migration[8.0]
  def change
    create_table :firms do |t|
      t.string :name
      t.string :website
      t.string :city

      t.timestamps
    end
  end
end
