class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.decimal :value_total
      t.integer :installments
      t.integer :due_date
      t.string :course_name
      t.references :educational_institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
