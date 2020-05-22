class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :user_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
