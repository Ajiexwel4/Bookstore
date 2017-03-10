class CreditCardForm < Rectify::Form
  CARD_ATTR = [:number, :name, :period, :cvv].freeze

  CARD_ATTR.each do |attr_name|    
    validates attr_name, presence: true 
  end
  attribute :number, Integer
  attribute :name, String
  attribute :period, String
  attribute :cvv, Integer
end