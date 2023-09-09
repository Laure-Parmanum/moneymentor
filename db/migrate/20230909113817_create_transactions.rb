class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :date
      t.integer :amount
      t.string :description
      t.string :payment_method
      t.string :category
      t.integer :user_id
      t.string :currency
      t.integer :account
      t.string :type

      t.timestamps
    end
  end
end
