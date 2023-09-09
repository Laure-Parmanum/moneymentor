class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.integer :date
      t.integer :current_balance
      t.integer :transaction_id

      t.timestamps
    end
  end
end
