class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :encrypted_password
      t.string :email
      t.string :role

      t.timestamps null: false
    end
  end
end
