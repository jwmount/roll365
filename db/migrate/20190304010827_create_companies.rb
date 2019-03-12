class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :credit_terms
      t.boolean :PO_required
      t.boolean :active
      t.integer :bookkeeping_number
      t.string :line_of_business
      t.string :url
      t.string :licensee

      t.references :address, polymorphic: true
      t.references :identifier, polymorphic: true
      t.references :cert, polymorphic: true
      t.references :requirement, polymorphic: true


      t.timestamps
    end
  end
end
