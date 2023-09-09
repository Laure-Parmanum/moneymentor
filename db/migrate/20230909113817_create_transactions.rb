class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.float :amount
      t.string :description
      t.string :payment_method
      t.string :category
      t.references :balance, foreign_key: true, null: false
      t.string :currency
      t.string :type

      t.timestamps
    end
  end
end
