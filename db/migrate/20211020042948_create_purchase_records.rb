class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.string :postcode,        null: false
      t.integer :region_id,      null: false
      t.string :city,            null: false
      t.string :street,          null: false
      t.string :building,        null: false
      t.string :phone_number,    null: false
      t.references :order,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
