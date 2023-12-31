class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.date :date, null: false
      t.integer :amount, null: false
      t.string :description, null: false
      t.references :category, foreign_key: true, null: true

      t.timestamps
    end
  end
end
