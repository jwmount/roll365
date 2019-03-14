class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :street_address
      t.string :city
      t.string :state
      t.string :post_code
      t.string :map_reference
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
