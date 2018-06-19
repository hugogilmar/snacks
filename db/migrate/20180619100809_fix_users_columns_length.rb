class FixUsersColumnsLength < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string, limit: 48
    change_column :users, :uuid, :string, limit: 36
    change_column :users, :name, :string, limit: 48
  end
end
