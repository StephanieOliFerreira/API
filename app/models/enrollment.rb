require 'date'

class Enrollment < ApplicationRecord
  belongs_to :educational_institution
  belongs_to :student

  has_many :payment

  validates :value_total, presence: true, numericality: { greater_than: 0}
  validates :installments, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validates :due_date, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31}
  validates :course_name, presence: true

  after_create :insert_payment

  def insert_payment
    #valor da fatura = valor total da matricula(curso) / quantidade de faturas
    payment_value = (self.value_total / self.installments)

    date = self.created_at
    if self.due_date <= date.day
      date = date.next_month
    end

    for i in 1..self.installments
      payday = self.due_date
      last_day = Date.new(date.year, date.month, -1).day
      if payday > last_day
        payday = last_day
      end
      payment = Payment.create(payment_value: payment_value,due_date: Date.new(date.year, date.month, payday), status: "Aberta", enrollment: self)
      date = date.next_month
    end
  end
end