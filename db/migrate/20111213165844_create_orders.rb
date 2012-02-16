class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :merchantid
      t.string :merchanttxnid
      t.string :orderid
      t.string :reportgroup
      t.string :ordersource
      t.string :amount
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :email
      t.string :cardnumber
      t.string :cardmonth
      t.string :cardyear
      t.string :cvv

      t.timestamps
    end
  end
end
