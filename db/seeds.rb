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


demo_company = Company.create(name: "Demo Company")

jon = Employee.create(name: "Jon", is_admin: true, schedule_color: '#FF4500', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << jon
matt = Employee.create(name: "Matt", is_admin: true, schedule_color: '#FFFF00', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << matt
ashe = Employee.create(name: "Ashe", is_admin: true, schedule_color: '#008000', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << ashe
ian =  Employee.create(name: "ian", schedule_color: '#000080', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << ian
natalie = Employee.create(name: "Natalie", schedule_color: '#AA0080', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << natalie
christina = Employee.create(name: "Christina", schedule_color: '#0AA080', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << christina
terrance = Employee.create(name: "Terrance", schedule_color: '#00AA80', password: 'dogs', password_confirmation: 'dogs')
demo_company.employees << terrance



materials = Service.create(name: "Materials")
company.services << materials

materials2 = Service.create(name: "Materials")
demo_company.services << materials2

roof_raise = Service.create(name: "Roof Raise", default_time: 4.50)
company.services << roof_raise

roof_raise2 = Service.create(name: "Roof Raise", default_time: 4.50)
demo_company.services << roof_raise2

joining = Service.create(name: "Joining")
company.services << joining

joining2 = Service.create(name: "Joining")
demo_company.services << joining2

sanding = Service.create(name: "Sanding", default_time: 3.50)
company.services << sanding

sanding2 = Service.create(name: "Sanding", default_time: 3.50)
demo_company.services << sanding2

milling = Service.create(name: "Milling")
company.services << milling

milling2 = Service.create(name: "Milling")
demo_company.services << milling2

polishing = Service.create(name: "Polishing", default_time: 2.50)
company.services << polishing

polishing2 = Service.create(name: "Polishing", default_time: 2.50)
demo_company.services << polishing2

cutting = Service.create(name: "Cutting", default_time: 3.0)
company.services << cutting

cutting2 = Service.create(name: "Cutting", default_time: 3.0)
demo_company.services << cutting2

finishing = Service.create(name: "Finishing", default_time: 0.5)
company.services << finishing

finishing2 = Service.create(name: "Finishing", default_time: 0.5)
demo_company.services << finishing2

planner_j1 = Planner.new(monday: Date.today.beginning_of_week)
company.planners << planner_j1

planner_demo = Planner.create(monday: Date.today.beginning_of_week)
demo_company.planners << planner_demo

planner_j2 = Planner.create(monday: Date.today.beginning_of_week + 1.weeks)
company.planners << planner_j2

# planner_demo = Planner.create(monday: Date.today.beginning_of_week + 1.weeks)
# demo_company.planners << planner_j12


client = Client.create(name: "Hucklberry Roasters")
company.clients << client

client_demo = Client.create(name: "Tom Sawyer Roasters")
demo_company.clients << client_demo

project = Project.create(name: "Dairy Block", subtype: "restaurant")
client.projects << project
planner_j1.projects << project
planner_j2.projects << project

project_demo = Project.create(name: "Dairy Block", subtype: "restaurant")
client_demo.projects << project_demo
planner_demo.projects << project_demo
# planner_demo.projects << project2

piece = Piece.create(name: "Shelving")
project.pieces << piece

procedure = Procedure.create(service: materials, piece: piece)
operation = Operation.create(employee: will, procedure: procedure, hours: 0.5, planner: planner_j1)

procedure = Procedure.create(service: joining, piece: piece)
operation = Operation.create(employee: jason, procedure: procedure, hours: 1.25, planner: planner_j1)


project = Project.create(name: "Pecos", subtype: "restaurant")
client.projects << project
planner_j1.projects << project
planner_j2.projects << project

piece = Piece.create(name: "Bar Tables")
project.pieces << piece

piece = Piece.create(name: "Shelves")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
operation = Operation.create(employee: sean, procedure: procedure, hours: 1, planner: planner_j1)
operation = Operation.create(employee: ty, procedure: procedure, hours: 2, planner: planner_j2)

procedure = Procedure.create(service: finishing, piece: piece)
operation = Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)
operation = Operation.create(employee: ty, procedure: procedure, hours: 1, planner: planner_j2)

procedure = Procedure.create(service: sanding, piece: piece)
operation = Operation.create(employee: ben, procedure: procedure, hours: 2, planner: planner_j1)
operation = Operation.create(employee: jason, procedure: procedure, hours: 1.5, planner: planner_j2)



piece = Piece.create(name: "Table")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
operation = Operation.create(employee: ty, procedure: procedure, hours: 1, planner: planner_j1)
operation = Operation.create(employee: sean, procedure: procedure, hours: 2, planner: planner_j1)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: ben, procedure: procedure, hours: 0.5, planner: planner_j1)
Operation.create(employee: will, procedure: procedure, hours: 2, planner: planner_j1)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)



client = Client.create(name: "ScrippsCPA")
company.clients << client

client2 = Client.create(name: "TaylorCPA")
demo_company.clients << client2

project = Project.create(name: "208 Bergen", subtype: "office")
client.projects << project
planner_j1.projects << project
planner_j2.projects << project

piece = Piece.create(name: "Table")
project.pieces << piece

procedure = Procedure.create(service: milling, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)


project = Project.create(name: "1433 Snyder Gulch", subtype: 'home')
client.projects << project
planner_j1.projects << project
planner_j2.projects << project

piece = Piece.create(name: "Deck")
project.pieces << piece
procedure = Procedure.create(service: milling, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j1)

procedure = Procedure.create(service: finishing, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: rachel, procedure: procedure, hours: 1.25, planner: planner_j2)

procedure = Procedure.create(service: sanding, piece: piece)
Operation.create(employee: jason, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: sean, procedure: procedure, hours: 1.25, planner: planner_j1)

procedure = Procedure.create(service: cutting, piece: piece)
Operation.create(employee: charley, procedure: procedure, hours: 0.75, planner: planner_j1)
Operation.create(employee: ty, procedure: procedure, hours: 1.25, planner: planner_j2)
