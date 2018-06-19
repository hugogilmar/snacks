class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :product
      t.string :uuid, limit: 36
      t.integer :quantity, default: 0
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.decimal :total, precision: 5, scale: 2, default: 0

      t.timestamps
    end

    add_index :orders, :uuid, unique: true
  end
end
