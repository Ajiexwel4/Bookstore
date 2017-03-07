class Checkout::StepsController < ApplicationController
  include Wicked::Wizard

  # before_action :redirect_to_first_invalid_step

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    render_wizard
  end

  def update
    render_wizard form
  end

  def form
    @form = form_object.new(model)
  end

  def model
    @model = case step
      when :address then Address
    end
  end

  def form_object
    case step
    when :address then AddressForm    
    end
  end

  # private

  #   def redirect_to_first_invalid_step
  #     return if steps[0] == step
  #     steps.to(steps.index(step) - 1).each do |s|
  #       jump_to s unless form_object(s).new(model).validate({})
  #     end
  #   end  
end