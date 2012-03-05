class CreateVoids < ActiveRecord::Migration
  def change
    create_table :voids do |t|

      t.string :litletxnid

      t.timestamps
    end
  end
end
