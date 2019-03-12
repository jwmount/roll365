class CreateIdentifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :identifiers do |t|
      t.references :identifiable, polymorphic: true, index: true
      t.string :name
      t.string :value
      t.integer :rank, limit: 3

      t.timestamps
    end
  end
end
