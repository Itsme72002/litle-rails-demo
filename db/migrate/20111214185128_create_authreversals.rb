class CreateAuthreversals < ActiveRecord::Migration
  def change
    create_table :authreversals do |t|
      t.string :merchantid
      t.string :merchanttxnid
      t.string :reportgroup
      t.string :litletxnid
      t.string :amount

      t.timestamps
    end
  end
end
