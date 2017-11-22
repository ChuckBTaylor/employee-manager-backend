# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(name: "Art Builder's Guild")
company.employees << Employee.create(name: "Jason", is_admin: true)
company.employees << Employee.create(name: "Charley", is_admin: true)
company.employees << Employee.create(name: "Ben", is_admin: true)
company.employees << Employee.create(name: "Will")
company.products << Product.create(name: "Chair")
company.products << Product.create(name: "Bench")
company.products << Product.create(name: "Stool")
