require 'spec_helper'

describe ProductsController do

  context "Rails env is production" do

    it "requests authentication" do
      puts "START"
      ProductsController.rails_env = "production"

      p ProductsController.rails_env

      get :index
      response.should be_redirect
      response.should redirect_to login_url
    end

  end

  context "Rails env is non production" do

    it "allows access without authentication" do
      ProductsController.rails_env = "non-production"

      get :index
      response.should be_success
      response.should render_template "index"
    end

  end

end