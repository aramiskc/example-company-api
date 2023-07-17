# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Employee.create(first_name: "Bob", last_name: "Builder", email: "bob@builder.com", phone: "8008888767", job_title: "Builder", department_id: 1)
# Employee.create(first_name: "Nick", last_name: "Broker", email: "nick@broker.com", phone: "8008845767", job_title: "CEO", department_id: 3)
# Employee.create(first_name: "Eugene", last_name: "Crabs", email: "gene@lovesseafood.com", phone: "9003455456", job_title: "Crabber", department_id: 2)

Department.create(name: "engineering", manager: "Micheal Scott", code: "ENG" )
Department.create(name: "food", manager: "Dwight Schrute", code: "FD" )
Department.create(name: "management", manager: "Bruce Wayne", code: "MGT" )