# frozen_string_literal: true

class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
