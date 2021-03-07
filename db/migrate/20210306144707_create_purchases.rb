class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postalcode, null:false
      t.integer    :prefecture_id, null:false
      t.string     :maincipality, null:false
      t.string     :address, null:false
      t.string     :building 
      t.string     :phone, null:false
      t.integer    :purchase_record_id, foreign_key: true

      t.timestamps
    end
  end
end
