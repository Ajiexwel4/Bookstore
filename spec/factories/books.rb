FactoryGirl.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    cover { FFaker::Book.cover }
    price { rand(1..1000)/100 }
    publication_at { FFaker::Time.date }
    dimension 'H:6.4" x W: 0.9" x D: 5.0"'
    material { FFaker::Lorem.words(4)}
    in_stock { rand(0..100) }
    authors { [create(:author)] }
    categories { [create(:category)] }
  end
end
