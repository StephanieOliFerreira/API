class EducationalInstitution < ApplicationRecord
    has_many :enrollment

    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :institution_type, presence: true, inclusion: { in: %w(Universidade Escola Creche) }
end
