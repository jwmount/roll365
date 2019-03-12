class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string  :addressable_type
      t.string :street_address
      t.string :city
      t.string :state
      t.string :post_code
      t.string :map_reference
      t.float :longitude
      t.float :latitude
      t.references :company, polymorphic: true
      t.references :person, polymorphic: true
      t.references :identifier, polymorphic: true
      t.references :cert, polymorphic: true
      t.references :requirement, polymorphic: true

      t.timestamps
    end
  end
end
