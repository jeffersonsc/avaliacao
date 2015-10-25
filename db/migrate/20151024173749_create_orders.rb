class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :amount
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
