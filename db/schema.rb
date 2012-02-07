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

ActiveRecord::Schema.define(:version => 20120207190723) do

  create_table "authreversals", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "reportgroup"
    t.string   "litletxnid"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "bookname"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "captures", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "orderid"
    t.string   "litletxnid"
    t.string   "amount"
    t.string   "cardnumber"
    t.string   "cardmonth"
    t.string   "cardyear"
    t.string   "cvv"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "reportgroup"
    t.string   "orderid"
    t.string   "litletxnid"
    t.string   "amount"
    t.string   "cardnumber"
    t.string   "cardmonth"
    t.string   "cardyear"
    t.string   "cvv"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "orderid"
    t.string   "reportgroup"
    t.string   "ordersource"
    t.string   "amount"
    t.string   "name"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.string   "cardnumber"
    t.string   "cardmonth"
    t.string   "cardyear"
    t.string   "cvv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "reportgroup"
    t.string   "orderid"
    t.string   "ordersource"
    t.string   "litletxnid"
    t.string   "amount"
    t.string   "cardnumber"
    t.string   "cardmonth"
    t.string   "cardyear"
    t.string   "cvv"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxid"
    t.string   "name"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "email"
    t.string   "cardnumber"
    t.string   "cardmonth"
    t.string   "cardyear"
    t.string   "cvv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voids", :force => true do |t|
    t.string   "merchantid"
    t.string   "merchanttxnid"
    t.string   "reportgroup"
    t.string   "litletxnid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
