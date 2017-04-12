FactoryGirl.define do
  factory :line_item do
    book nil
    cart nil
    quantity 1
    sub_total "9.99"
  end
end
