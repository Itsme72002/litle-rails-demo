class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|

      t.string :litletxnid
      t.string :amount
      t.timestamps
    end
  end
end
