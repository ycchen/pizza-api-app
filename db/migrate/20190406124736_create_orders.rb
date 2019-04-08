# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.decimal :total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
