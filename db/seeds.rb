# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.delete_all
Author.create(firstname: "Vitaly", lastname: "Friedman")
Author.create(firstname: "Daniel", lastname: "Mall")
Author.create(firstname: "Bass", lastname: "Jobsen")
Author.create(firstname: "David", lastname: "Cochran")
Author.create(firstname: "Ian", lastname: "Whitley")
Author.create(firstname: "John", lastname: "Horton")

Category.delete_all
Category.create(name: "Mobile development")
Category.create(name: "Photo")
Category.create(name: "Web design")
Category.create(name: "Web development")
