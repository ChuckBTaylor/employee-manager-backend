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

materials = Service.create(name: "Materials")
company.services << materials
roof_raise = Service.create(name: "Roof Raise")
company.services << roof_raise
joining = Service.create(name: "Joining")
company.services << joining
sanding = Service.create(name: "Sanding")
company.services << sanding
milling = Service.create(name: "Milling")
company.services << milling
polishing = Service.create(name: "Polishing")
company.services << polishing
cutting = Service.create(name: "Cutting")
company.services << cutting
finishing = Service.create(name: "Finishing")
company.services << finishing



client = Client.create(name: "Hucklberry Roasters")
company.clients << client

project = Project.create(name: "Dairy Block", subtype: "restaurant")
client.projects << project


project = Project.create(name: "Pecos", subtype: "restaurant")
client.projects << project

piece = Piece.create(name: "Shelves")
project.pieces << piece
procedure = Procedure.create(expected_time: 2.00, service: milling, piece: piece)
procedure = Procedure.create(expected_time: 1.00, service: finishing, piece: piece)
procedure = Procedure.create(expected_time: 1.50, service: sanding, piece: piece)



piece = Piece.create(name: "Table")
project.pieces << piece
procedure = Procedure.create(expected_time: 2.00, service: milling, piece: piece)
procedure = Procedure.create(expected_time: 1.00, service: finishing, piece: piece)
procedure = Procedure.create(expected_time: 1.50, service: sanding, piece: piece)



client = Client.create(name: "ScrippsCPA")
company.clients << client

project = Project.create(name: "208 Bergen", subtype: "office")
client.projects << project

piece = Piece.create(name: "Table")
project.pieces << piece
procedure = Procedure.create(expected_time: 2.00, service: milling, piece: piece)
procedure = Procedure.create(expected_time: 1.00, service: finishing, piece: piece)
procedure = Procedure.create(expected_time: 1.50, service: sanding, piece: piece)


project = Project.create(name: "1433 Snyder Gulch", subtype: 'home')
client.projects << project

piece = Piece.create(name: "Deck")
project.pieces << piece
procedure = Procedure.create(expected_time: 2.00, service: milling, piece: piece)
procedure = Procedure.create(expected_time: 1.00, service: finishing, piece: piece)
procedure = Procedure.create(expected_time: 1.50, service: sanding, piece: piece)
procedure = Procedure.create(expected_time: 1.50, service: cutting, piece: piece)
