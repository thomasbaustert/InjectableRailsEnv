require 'injectable_rails_env'

class ProductsController < ApplicationController
  include InjectableRailsEnv

  puts rails_env_production?
  puts rails_env

  before_filter(:authenticate) if rails_env_production?

  def index
  end

  private

  def authenticate
    redirect_to login_url unless logged_in?
  end

  def logged_in?
    false
  end

end
