# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(name: "Art Builder's Guild")

company.employees << Employee.create(name: "Jason", is_admin: true, schedule_color: '#FF4500')
company.employees << Employee.create(name: "Charley", is_admin: true, schedule_color: '#FFFF00')
company.employees << Employee.create(name: "Ben", is_admin: true, schedule_color: '#008000')
company.employees << Employee.create(name: "Will", schedule_color: '#000080')
company.employees << Employee.create(name: "Rachel", schedule_color: '#AA0080')
company.employees << Employee.create(name: "Ty", schedule_color: '#0AA080')
company.employees << Employee.create(name: "Sean", schedule_color: '#00AA80')

company.products << Product.create(name: "Chair")
company.products << Product.create(name: "Bench")
company.products << Product.create(name: "Stool")

company.services << Service.create(name: "Materials")

client = Client.create(name: "Hucklberry Roasters")
company.clients << client

client.projects << Project.create(name: "Pecos", subtype: "Restaurant")
