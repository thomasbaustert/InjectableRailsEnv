require 'injectable_rails_env'

class JobsController < ApplicationController
  include InjectableRailsEnv

  # TODO 23.06.12/17:22/tbaustert rails_env_production? must be a class method here
  #before_filter(:authenticate) unless rails_env_production?
  before_filter :authenticate

  def index
  end

  private

  def authenticate
    return true unless rails_env_production?
    redirect_to login_url
  end

end
