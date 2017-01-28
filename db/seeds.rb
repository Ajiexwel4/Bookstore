# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Publication.delete_all
Book.delete_all
# Book.new(title: "Real-Life Responsive Web Design", description: "Smashing Book 5: Real-Life Responsive Web Design is our brand new, upcoming book with smart front-end techniques and design patterns derived from real-life responsive projects. With 13 chapters on responsive workflow, SVG, Flexbox, Web fonts, responsive images, responsive email, content strategy, debugging application", price: 32.90)

Author.delete_all
# Author.create(firstname: "Vitaly", lastname: "Friedman")
# Author.create(firstname: "Daniel", lastname: "Mall")
# Author.create(firstname: "Bass", lastname: "Jobsen")
# Author.create(firstname: "David", lastname: "Cochran")
# Author.create(firstname: "Ian", lastname: "Whitley")
# Author.create(firstname: "John", lastname: "Horton")

Category.delete_all
# Category.create(name: "Mobile development")
# Category.create(name: "Photo")
# Category.create(name: "Web design")
# Category.create(name: "Web development")

Dimension.delete_all
# Dimension.create(height: 6.4, width: 0.9, deep: 5.0)

Material.delete_all
# Material.create(cover: "Hardcove", paper: "glossy paper")

