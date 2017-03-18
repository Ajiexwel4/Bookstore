class Order < ApplicationRecord
  include AASM  
  SORTING = ['all_by_date', 'in_progress', 'in_queue', 'in_delivery', 'delivered', 'canceled'].freeze

  has_many :line_items, dependent: :destroy
  belongs_to :user
  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  has_one :delivery
  has_one :credit_card

  scope :all_by_date, ->{ order(:created_at) }

  aasm column: 'status', whiny_transitions: false do
    state :in_progress, initial: true
    state :in_queue, :in_delivery, :delivered, :canceled

    event :accept do
      transitions :from => :in_progress, :to => :in_queue
    end

    event :deliver do
      transitions :from => :in_queue, :to => :in_delivery
    end

    event :finish do
      transitions :from => :in_delivery, :to => :delivered
    end

    event :cancel do
      transitions :from => [:in_queue, :in_delivery, :delivered, :canceled], :to => :canceled
    end
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
