# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_406_124_752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'orders', force: :cascade do |t|
    t.bigint 'user_id'
    t.decimal 'total', precision: 5, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'pizza_orders', force: :cascade do |t|
    t.bigint 'order_id'
    t.bigint 'pizza_id'
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_pizza_orders_on_order_id'
    t.index ['pizza_id'], name: 'index_pizza_orders_on_pizza_id'
  end

  create_table 'pizza_toppings', force: :cascade do |t|
    t.bigint 'topping_id'
    t.bigint 'pizza_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pizza_id'], name: 'index_pizza_toppings_on_pizza_id'
    t.index ['topping_id'], name: 'index_pizza_toppings_on_topping_id'
  end

  create_table 'pizzas', force: :cascade do |t|
    t.string 'name'
    t.decimal 'price', precision: 5, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'toppings', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'orders', 'users'
  add_foreign_key 'pizza_orders', 'orders'
  add_foreign_key 'pizza_orders', 'pizzas'
  add_foreign_key 'pizza_toppings', 'pizzas'
  add_foreign_key 'pizza_toppings', 'toppings'
end
