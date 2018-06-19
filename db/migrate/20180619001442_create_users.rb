class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role, default: 1
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :authentication_token, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :uuid, unique: true
    add_index :users, :authentication_token, unique: true
  end
end
