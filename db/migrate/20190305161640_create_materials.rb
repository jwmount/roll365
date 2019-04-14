class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.references :materialable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
