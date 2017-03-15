Category.all.each { |category| category.books.delete_all }
Author.all.each { |author| author.books.delete_all }
Book.all.each { |book| book.line_items.delete_all }
LineItem.delete_all
Author.delete_all
Book.delete_all
BillingAddress.delete_all
ShippingAddress.delete_all
Delivery.delete_all
Order.delete_all


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
    # book.cover = book.pictures.create(file: 'app/assets/images/1.jpg')
    book.authors = [Author.last, Author.first]
    book.categories = [Category.find(rand(1..4)), Category.find(rand(1..4))] 
  end
end

User.find_or_create_by(email: 'test@test.ua') do |user|
  user.password = 'password'
  user.firstname = FFaker::Name.first_name
  user.lastname = FFaker::Name.last_name
  # user.avatar = user.create_picture(file: 'app/assets/images/C06035.jpg')
end

User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.firstname = FFaker::Name.first_name
  user.lastname = FFaker::Name.last_name
  user.admin = true
  user.avatar = user.create_picture(file: 'app/assets/images/C06035.jpg')
end

Coupon.find_or_create_by(code: 123452){ |coupon| coupon.discount = 2 }
Coupon.find_or_create_by(code: 123453){ |coupon| coupon.discount = 3 }
Coupon.find_or_create_by(code: 123454){ |coupon| coupon.discount = 4 }

['Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 
'Bahamas', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Bolivia', 'Botswana', 'Brazil', 'Bulgaria', 
'Cambodia', 'Cameroon', 'Canada', 'Chad', 'Chile', 'China', 'Colombia', 'Congo', 'Cuba', 'Cyprus', 'Czech', 
'Denmark', 'Dominica', 'Ecuador', 'Egypt', 'Estonia', 'Fiji', 'Finland', 'France', 
'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Guatemala', 'Guinea', 'Honduras', 'Hungary',
'Iceland', 'India', 'Indonesia', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Kazakstan', 'Kenya', 'Kuwait', 'Kyrgyzstan', 
'Latvia',  'Liberia', 'Liechtenstein', 'Luxembourg', 'Macedoni',  'Malaysia', 'Malta', 'Mauritania', 'Mexico', 'Micronesi', 'Moldov',
'Monaco', 'Mongolia', 'Morocco', 'Mozambique', 'Nepal', 'Netherlands', 'Nicaragua', 'Norway', 'Oman', 
'Pakistan', 'Panama', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn', 'Poland', 'Portugal', 'Qatar', 'Reunion', 'Romania', 'Russia', 
'Senegal', 'Serbia', 'Singapore', 'Slovakia', 'Slovenia', 'Spain', 'Sudan', 'Suriname',  'Swaziland', 'Sweden', 'Switzerland', 
'Taiwa',  'Tajikistan', 'Thailand', 'Togo', 'Tunisia', 'Turkey', 'Turkmenistan', 'Uganda', 'Ukraine', 'UAE', 'UK', 'USA', 'Uruguay', 'Uzbekistan', 
'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'].each { |country| Country.find_or_create_by(name: country) }

Delivery.find_or_create_by(title: 'Delivery Next Day!') do |delivery|
  delivery.days = '3 to 7 days'
  delivery.price = 10
end

Delivery.find_or_create_by(title: 'Express!') do |delivery|
  delivery.days = '1 to 3 days'
  delivery.price = 30
end


