class Enrollment < ApplicationRecord
  belongs_to :educational_institution
  belongs_to :student
  validates :value, presence: true, numericality: { greater_than: 0}
  validates :installments, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31}
  validates :course_name, presence: true
end
