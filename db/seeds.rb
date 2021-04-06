# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

st = Student.create(name: 'TeteOliLegends', cpf: '01234567890', gender: 'F', payment_method: 'Cartao')
ei = EducationalInstitution.create(name: 'Unip', cnpj: '06099229000101', institution_type: 'Universidade')
er = Enrollment.create(value_total: 1000.00, installments: 10, due_date: 15, course_name: 'ADS', educational_institution_id: 1, student_id: 1)