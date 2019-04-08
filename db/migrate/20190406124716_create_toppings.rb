# frozen_string_literal: true

class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.string :name

      t.timestamps
    end
  end
end
