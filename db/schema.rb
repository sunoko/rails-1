# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121012175936) do

  create_table "balances", :force => true do |t|
    t.string   "currency"
    t.decimal  "amount"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "balanceable_id"
    t.string   "balanceable_type"
  end

  create_table "depth_runs", :force => true do |t|
    t.integer  "market_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exchange_balances", :force => true do |t|
    t.integer  "strategy_id"
    t.integer  "exchange_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exchanges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "markets", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "exchange_id"
    t.integer  "from_exchange_id"
    t.string   "from_currency"
    t.integer  "to_exchange_id"
    t.string   "to_currency"
    t.decimal  "fee_percentage"
    t.integer  "delay_ms"
  end

  create_table "offers", :force => true do |t|
    t.datetime "listed_at"
    t.string   "bidask"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "depth_run_id"
    t.decimal  "price"
    t.decimal  "quantity"
    t.string   "currency"
    t.integer  "market_id"
  end

  create_table "strategies", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "balance_in_id"
    t.integer  "balance_out_id"
    t.integer  "potential_id"
  end

  create_table "tickers", :force => true do |t|
    t.integer  "market_id"
    t.decimal  "highest_bid_usd"
    t.decimal  "lowest_ask_usd"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tickers", ["market_id"], :name => "index_tickers_on_market_id"

  create_table "trades", :force => true do |t|
    t.integer  "market_id"
    t.integer  "strategy_id"
    t.decimal  "expected_fee"
    t.decimal  "fee"
    t.decimal  "expected_rate"
    t.decimal  "rate"
    t.boolean  "executed"
    t.string   "order_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "balance_in_id"
    t.integer  "balance_out_id"
  end

  add_index "trades", ["market_id"], :name => "index_trades_on_market_id"
  add_index "trades", ["strategy_id"], :name => "index_trades_on_strategy_id"

end