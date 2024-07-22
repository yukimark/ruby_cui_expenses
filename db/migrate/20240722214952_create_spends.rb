class CreateSpends < ActiveRecord::Migration[7.1]
  def change
    create_table :spends do |t|
      t.string :category, null: false
      t.integer :price, null: false
      t.boolean :fixedcost, null: false
      t.boolean :deferredpay, null: false

      t.timestamps
    end
  end
end
