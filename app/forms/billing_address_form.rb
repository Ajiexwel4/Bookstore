class BillingAddressForm < Rectify::Form
  ADDRESS_ATTR = [:firstname, :lastname, :address, :city, :zip, :country, :phone].freeze

  ADDRESS_ATTR.each do |attr_name|
    attribute attr_name, String
    validates attr_name, presence: true 
  end
end