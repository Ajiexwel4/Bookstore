FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password}

    factory :admin, class: User do
      admin true
    end
  end
end
