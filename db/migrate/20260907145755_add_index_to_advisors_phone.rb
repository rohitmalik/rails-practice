class AddIndexToAdvisorsPhone < ActiveRecord::Migration[8.0]
  def change
    add_index :advisors, :phone
  end
end
