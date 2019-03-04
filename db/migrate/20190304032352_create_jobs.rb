class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :solution_id
      t.datetime :start_on
      t.string :time
      t.string :name
      t.datetime :finished_on
      t.string :purchase_order
      t.boolean :active
      t.boolean :complete

      t.timestamps
    end
  end
end
