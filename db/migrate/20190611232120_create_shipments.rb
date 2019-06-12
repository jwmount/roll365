class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :ship_from
      t.string :ship_to
      t.string :pickup
      t.string :deadline
      t.text   :cargo
      t.string :utilization
      t.text   :quote_basis
      t.decimal :quote_complete
      t.string :tracking_id

      t.timestamps
    end
    add_index :shipments, :ship_from
    add_index :shipments, :ship_to
    add_index :shipments, :tracking_id, unique: true
  end
end
