class CreateCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :description
      t.boolean :for_person
      t.boolean :for_company
      t.boolean :for_equipment
      t.boolean :for_location
      t.boolean :active
      t.string  "issued_by"
      t.datetime "issued_on"
      t.datetime "expires_on"
      t.string   "basis"

      t.timestamps
    end
  end
end
