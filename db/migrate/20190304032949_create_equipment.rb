class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name, limit: 60
      t.integer :company_id
      t.string :description
      t.timestamps
    end
  end
end
