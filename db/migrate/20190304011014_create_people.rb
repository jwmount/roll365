class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :role
      t.boolean :available
      t.datetime :available_on
      t.boolean :OK_to_contact
      t.boolean :active

      t.timestamps
    end
  end
end
