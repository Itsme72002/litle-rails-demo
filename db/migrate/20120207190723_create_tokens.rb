class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :merchantid
      t.string :merchanttxid
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
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
