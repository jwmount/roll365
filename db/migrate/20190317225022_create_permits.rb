class CreatePermits < ActiveRecord::Migration[5.2]
  def change
    create_table :permits do |t|
      t.references :permitable, polymorphic: true
      t.string  :name
      t.string  :description
      t.decimal :fee
      t.string  :issuer
      t.string  :jurisdiction
      t.string  :basis
      t.boolean :required
      t.boolean :for_person
      t.boolean :for_company
      t.boolean :for_equipment
      t.boolean :for_location
      t.boolean :permanent
      t.datetime :valid_from
      t.datetime :valid_to

      t.timestamps
    end
  end
end
