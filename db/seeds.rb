Category.all.each { |category| category.books.delete_all }
Author.all.each { |author| author.books.delete_all }
Author.delete_all
Book.delete_all

['Mobile development', 'Photo', 'Web design', 'Web development'].each { |name| Category.find_or_create_by(name: name) }

30.times do 
  Author.find_or_create_by(firstname: FFaker::Name.first_name) do |author|
    author.lastname = FFaker::Name.last_name
    author.description = FFaker::Lorem.paragraph
  end

  Book.find_or_create_by(title: FFaker::Book.title) do |book|
    book.description = FFaker::Book.description    
    book.price = rand(1..3000)/100
    book.publication_at = FFaker::Time.date
    book.dimension = 'H:6.4" x W: 0.9" x D: 5.0"'
    book.material = FFaker::Lorem.words(4)
    book.in_stock = rand(0..99)
    book.authors = [Author.last, Author.first]
    book.categories = [Category.find(rand(1..4)), Category.find(rand(1..4))] 
  end
end

User.find_or_create_by(email: 'test@test.ua') do |user|
  user.password = 'password'
  user.firstname = FFaker::Name.first_name
  user.lastname = FFaker::Name.last_name
end

User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.firstname = FFaker::Name.first_name
  user.lastname = FFaker::Name.last_name
  user.admin = true
end

Coupon.find_or_create_by(code: 123452){ |coupon| coupon.discount = 2 }
Coupon.find_or_create_by(code: 123453){ |coupon| coupon.discount = 3 }
Coupon.find_or_create_by(code: 123454){ |coupon| coupon.discount = 4 }
