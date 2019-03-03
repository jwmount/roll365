class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :credit_terms
      t.boolean :PO_required
      t.boolean :active
      t.string :bookkeeping_number
      t.string :line_of_business
      t.string :url
      t.boolean :license

      t.timestamps
    end
  end
end
