class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :credit_terms
      t.boolean :PO_required
      t.boolean :active
      t.string :bookkeeping_number
      t.string :line_of_business
      t.string :url

      t.timestamps
    end
  end
end
