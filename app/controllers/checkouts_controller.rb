class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    render_wizard
  end

  def update
    render_wizard    
  end
end