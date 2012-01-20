class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :merchantid
      t.string :merchanttxnid
      t.string :reportgroup
      t.string :orderid
      t.string :ordersource
      t.string :litletxnid
      t.string :amount
      t.string :cardnumber
      t.string :cardmonth
      t.string :cardyear
      t.string :cvv
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :email

      t.timestamps
    end
  end
end
