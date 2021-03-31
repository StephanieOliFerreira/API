class Student < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :gender, presence: true, inclusion: { in: %w(F M) }
    validates :payment_method, presence: true, inclusion: { in: %w(Boleto Cartao) }
end
