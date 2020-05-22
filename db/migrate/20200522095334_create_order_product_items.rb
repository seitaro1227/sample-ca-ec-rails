class CreateOrderProductItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_product_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :product_name
      t.integer :count

      t.timestamps
    end
  end
end
