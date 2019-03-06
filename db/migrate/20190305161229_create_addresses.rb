class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :company, polymorphic: true
      t.string :street_address
      t.string :city{30}
      t.string :state{2}
      t.string :post_code{10}
      t.string :map_reference
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
