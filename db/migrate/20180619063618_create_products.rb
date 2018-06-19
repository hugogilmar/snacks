class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :uuid, null: false, limit: 36
      t.string :sku, null: false, limit: 12
      t.string :name, null: false, limit: 48
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end

    add_index :products, :uuid, unique: true
    add_index :products, :sku, unique: true
  end
end
