class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.date :date
      t.float :current_balance
      t.references :user, foreign_key: true, null: false
      t.integer :account_number
      t.timestamps
    end
  end
end
