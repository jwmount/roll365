class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :tracking_id
      t.string :ship_from
      t.string :ship_to
      t.string :pickup
      t.string :deadline
      t.boolean :ontime
      t.boolean :completed
      t.boolean :delayed
      t.text   :cargo
      t.string :utilization
      t.text   :quote_basis
      t.decimal :quote_complete
      t.integer :status

      t.timestamps
    end
    add_index :shipments, :ship_from
    add_index :shipments, :ship_to
    add_index :shipments, :tracking_id, unique: true
  end
end
