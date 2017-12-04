# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(name: "Art Builder's Guild")

jason = Employee.create(name: "Jason", is_admin: true, schedule_color: '#FF4500', password: 'dogs', password_confirmation: 'dogs')
company.employees << jason
charley = Employee.create(name: "Charley", is_admin: true, schedule_color: '#FFFF00', password: 'dogs', password_confirmation: 'dogs')
company.employees << charley
ben = Employee.create(name: "Ben", is_admin: true, schedule_color: '#008000', password: 'dogs', password_confirmation: 'dogs')
company.employees << ben
will =  Employee.create(name: "Will", schedule_color: '#000080', password: 'dogs', password_confirmation: 'dogs')
company.employees << will
rachel = Employee.create(name: "Rachel", schedule_color: '#AA0080', password: 'dogs', password_confirmation: 'dogs')
company.employees << rachel
ty = Employee.create(name: "Ty", schedule_color: '#0AA080', password: 'dogs', password_confirmation: 'dogs')
company.employees << ty
sean = Employee.create(name: "Sean", schedule_color: '#00AA80', password: 'dogs', password_confirmation: 'dogs')
company.employees << sean


materials = Service.create(name: "Materials")
company.services << materials
roof_raise = Service.create(name: "Roof Raise", default_time: 4.50)
company.services << roof_raise
joining = Service.create(name: "Joining")
company.services << joining
sanding = Service.create(name: "Sanding", default_time: 3.50)
company.services << sanding
milling = Service.create(name: "Milling")
company.services << milling
polishing = Service.create(name: "Polishing", default_time: 2.50)
company.services << polishing
cutting = Service.create(name: "Cutting", default_time: 3.0)
company.services << cutting
finishing = Service.create(name: "Finishing", default_time: 0.5)
company.services << finishing

planner1 = Planner.create(monday: Date.today.beginning_of_week)
company.planners << planner1

planner2 = Planner.create(monday: Date.today.beginning_of_week + 1.weeks)
company.planners << planner2


client = Client.create(name: "Hucklberry Roasters")
company.clients << client

project = Project.create(name: "Dairy Block", subtype: "restaurant")
client.projects << project
planner1.projects << project
planner2.projects << project

piece = Piece.create(name: "Shelving")
project.pieces << piece

procedure = Procedure.create(service: materials, piece: piece)
operation = Operation.create(employee: will, procedure: procedure, hours: 0.5, planner: planner1)

procedure = Procedure.create(service: joining, piece: piece)
operation = Operation.create(employee: jason, procedure: procedure, hours: 1.25, planner: planner2)


project = Project.create(name: "Pecos", subtype: "restaurant")
client.projects << project
planner1.projects << project

piece = Piece.create(name: "Bar Tables")
project.pieces << piece

piece = Piece.create(name: "Shelves")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
operation = Operation.create(employee: sean, procedure: procedure, hours: 1, planner: planner2)
operation = Operation.create(employee: ty, procedure: procedure, hours: 2, planner: planner1)

procedure = Procedure.create(service: finishing, piece: piece)
operation = Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)
operation = Operation.create(employee: ty, procedure: procedure, hours: 1, planner: planner1)

procedure = Procedure.create(service: sanding, piece: piece)
operation = Operation.create(employee: ben, procedure: procedure, hours: 2, planner: planner2)
operation = Operation.create(employee: jason, procedure: procedure, hours: 1.5, planner: planner1)



piece = Piece.create(name: "Table")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
operation = Operation.create(employee: ty, procedure: procedure, hours: 1, planner: planner1)
operation = Operation.create(employee: sean, procedure: procedure, hours: 2, planner: planner1)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: ben, procedure: procedure, hours: 0.5, planner: planner1)
Operation.create(employee: will, procedure: procedure, hours: 2, planner: planner1)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)



client = Client.create(name: "ScrippsCPA")
company.clients << client

project = Project.create(name: "208 Bergen", subtype: "office")
client.projects << project
planner1.projects << project

piece = Piece.create(name: "Table")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner2)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner2)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner2)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)


project = Project.create(name: "1433 Snyder Gulch", subtype: 'home')
client.projects << project
planner2.projects << project
planner1.projects << project

piece = Piece.create(name: "Deck")
project.pieces << piece
procedure = Procedure.create(service: milling, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner1)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner2)
Operation.create(employee: sean, procedure: procedure, hours: 1.25, planner: planner1)

procedure = Procedure.create(service: cutting, piece: piece)
Operation.create(employee: charley, procedure: procedure, hours: 0.75, planner: planner1)
Operation.create(employee: ty, procedure: procedure, hours: 1.25, planner: planner1)
