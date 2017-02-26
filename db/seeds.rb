# Author.delete_all
# Author.create(firstname: "Vitaly", lastname: "Friedman")
# Author.create(firstname: "Daniel", lastname: "Mall")
# Author.create(firstname: "Bass", lastname: "Jobsen")
# Author.create(firstname: "David", lastname: "Cochran")
# Author.create(firstname: "Ian", lastname: "Whitley")
# Author.create(firstname: "John", lastname: "Horton")

# Category.delete_all
# Category.create(name: "Mobile development")
# Category.create(name: "Photo")
# Category.create(name: "Web design")
# Category.create(name: "Web development")

# User.delete_all
User.find_by_email('admin@example.com').delete
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
