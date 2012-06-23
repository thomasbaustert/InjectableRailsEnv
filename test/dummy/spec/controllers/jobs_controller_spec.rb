require 'spec_helper'

describe JobsController do

  context "Rails env is production" do

    it "requests authentication" do
      @controller.rails_env = "production"

      get :index
      response.should be_redirect
      response.should redirect_to login_url
    end

  end

  context "Rails env is non production" do

    it "allows access without authentication" do
      @controller.rails_env = "non-production"

      get :index
      response.should be_success
      response.should render_template "index"
    end

  end

end