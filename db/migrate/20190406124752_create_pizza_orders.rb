class CreatePizzaOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :pizza_orders do |t|
      t.references :order, foreign_key: true
      t.references :pizza, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
