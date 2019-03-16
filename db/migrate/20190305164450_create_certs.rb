class CreateCerts < ActiveRecord::Migration[5.2]
  def change
    create_table :certs do |t|
      
      t.references :certifiable, polymorphic: true, index: true
       
      t.datetime :expires_on
      t.string :serial_number
      t.boolean :permanent
      t.boolean :active

      t.timestamps
    end
  end
end
