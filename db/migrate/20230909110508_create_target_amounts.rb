class CreateTargetAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :target_amounts do |t|
      t.integer :date
      t.integer :target_amount
      t.integer :balance_id
      t.string :status
      t.string :history_transaction

      t.timestamps
    end
  end
end
