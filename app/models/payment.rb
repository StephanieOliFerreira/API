class Payment < ApplicationRecord
  belongs_to :enrollment
  validates :payment_value, presence: true
  validates :due_date, presence: true
  validates :status, presence:true, inclusion: { in: %w(Aberta Atrasada Paga) }
end
