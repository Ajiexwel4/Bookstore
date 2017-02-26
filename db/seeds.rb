[User, Author, Category, Book, Cart, LineItem, Order].each { |model| model.delete_all }

User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

10.times { Author.create(FFaker::Name.first_name, FFaker::Name.last_name, Faker::Lorem.paragraph) }

['Mobile development', 'Photo', 'Web design', 'Web development'].each {|name| Category.create(name) }

Category.all.each do |category|
  10.times do
    Book.create do |book|
      book.title { FFaker::Book.title }
      book.description { FFaker::Book.description }
      book.cover { FFaker::Book.cover }
      book.price { rand(1..1000)/100 }
      book.publication_at { FFaker::Time.date }
      book.dimension 'H:6.4" x W: 0.9" x D: 5.0"'
      book.material { FFaker::Lorem.words(4)}
      book.in_stock { rand(0..100) }
      book.authors { [create(:author)] }
      book.categories { [create(:category)] }
    end
  end
end

['glossy paper', 'wood', 'textile', 'glass'].each do |name|
  Material.find_or_create_by!(name: name)
end

Book.find_each do |book|
  book.authors = Author.last(rand(1..3))
  book.materials = Material.last(rand(1..3))
end

{ 'Ukraine': '380', 'Russia': '230' }.each do |name, code|
  Country.find_or_create_by!(name: name, code: code)
end

Country.find_each do |country|
  %w[Standart Express].each do |delivery_name|
    Delivery.find_or_create_by!(name: "#{country.name}#{delivery_name}") do |delivery|
      delivery.country = country
      delivery.price = rand(30..100)
      delivery.min_days = rand(5..10)
      delivery.max_days = rand(15..20)
    end
  end
end

User.find_or_create_by!(email: 'yaroslav555@gmail.com') do |user|
  user.password = 'Password555'
  user.password_confirmation = 'Password555'
  user.admin = true
end

ORDER_STATES = [:in_progress, :in_transit, :delivered, :canceled]

User.find_each do |user|

  card = CreditCard.find_or_create_by!(number: 5274576394259961, user: user) do |card|
    card.name = FFaker::Name.first_name
    card.cvv = '123'
    card.month_year = '12/17'
  end

  country = Country.find(rand(1..Country.count))

  user.shipping = Address.create! do |shipping|
    shipping.address_type = 'shipping'
    shipping.first_name = FFaker::Name.first_name
    shipping.last_name = FFaker::Name.last_name
    shipping.name = FFaker::Address.street_name
    shipping.city = 'Dnepr'
    shipping.zip = 49000
    shipping.country = country
    shipping.phone = "+#{country.code}632863823"
  end

  user.billing = Address.create! do |billing|
    billing.address_type = 'billing'
    billing.first_name = FFaker::Name.first_name
    billing.last_name = FFaker::Name.last_name
    billing.name = FFaker::Address.street_name
    billing.city = 'Dnepr'
    billing.zip = 49000
    billing.country = country
    billing.phone = "+#{country.code}632863823"
  end

  rand(3..6).times do

    order = Order.create! do |order|
      order.credit_card = card.dup
      order.shipping = user.shipping.dup
      order.billing = user.billing.dup
      order.delivery = country.deliveries.first
      order.state = ORDER_STATES[rand(0..3)]
    end

    rand(1..5).times do
      item = OrderItem.create! do |item|
        item.quantity = rand(1..3)
        item.book_id = rand(1..Book.count)
        order.order_items << item
      end

      user.orders << order
    end
  end

  user.save!
end
