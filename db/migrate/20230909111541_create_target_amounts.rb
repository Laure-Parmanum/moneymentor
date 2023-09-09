class CreateTargetAmounts < ActiveRecord::Migration[7.0]
  def change
    create_table :target_amounts do |t|
      t.date :target_date
      t.integer :target_amount
      t.references :balance, foreign_key: true, null: false
      t.string :status

      t.timestamps
    end
  end
end
