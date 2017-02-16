class HomeController < ApplicationController
  before_action :authenticate_admin_user
  def index
  end

  def book_page; end
  def cart; end
  def catalog; end
  def checkout_address; end
  def checkout_complete; end
  def checkout_confirm; end
  def checkout_delivery; end
  def checkout_payment; end
  def home; end
  def log_in; end
  def new_password; end
  def orders; end
  def password; end
  def settings; end
  def ui_kit; end
  def view_orders; end
end
