class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
     
      t.string :litletxnid
      t.string :amount

      t.timestamps
    end
  end
end
