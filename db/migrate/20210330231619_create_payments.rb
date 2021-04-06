class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :payment_value
      t.date :due_date
      t.references :enrollment, null: false, foreign_key: true
      t.string :status, default: "Aberta"

      t.timestamps
    end
  end
end
