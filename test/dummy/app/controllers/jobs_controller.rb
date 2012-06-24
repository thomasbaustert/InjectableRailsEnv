require 'injectable_rails_env'

class JobsController < ApplicationController
  include InjectableRailsEnv

  # using rails_env_production? on the class level will not work. See README
  # before_filter(:authenticate) if rails_env_production?
  before_filter :authenticate

  def index
  end

  private

  def authenticate
    return unless rails_env_production?
    redirect_to login_url unless logged_in?
  end

  def logged_in?
    false
  end

end
