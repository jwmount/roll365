class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :by
      t.text :body
      t.string :tracking_id
      
      t.timestamps
    end
    add_index :comments, :tracking_id, unique: true
  end
end
