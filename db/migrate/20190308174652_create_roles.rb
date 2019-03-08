class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name{30}
      t.string :email{30}

      t.timestamps
    end
  end
end
