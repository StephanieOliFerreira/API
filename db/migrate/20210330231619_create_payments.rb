class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :payment_value
      t.datetime :due_data
      t.references :enrollment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
