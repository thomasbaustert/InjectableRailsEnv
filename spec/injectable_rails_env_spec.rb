require 'spec_helper'
require File.expand_path "../../lib/injectable_rails_env", __FILE__

describe "InjectableRailsEnv" do

  class Foo
    include InjectableRailsEnv

    # TODO 23.06.12/16:16/tbaustert  
    #def execute_in_production_only
    #  raise "Woot" if rails_env_production?
    #end
  end

  let(:foo) { Foo.new }

  # TODO 23.06.12/16:16/tbaustert
  # - integration? staging? ci? customer env?
  # - Foo.rails_env = "production"

  describe "#rails_env_production?" do

    it "is a private method" do
      should_be_private_method(:rails_env_production?)
    end

    context "without injected rails_env" do

      it "delegates to Rails.env.production?" do
        Rails.env.should_receive(:production?)
        foo.send(:rails_env_production?)
      end
    end

    context "with injected rails_env" do

      context "in production env" do
        it "returns true" do
          foo.rails_env = "production"
          foo.send(:rails_env_production?).should be_true
        end
      end

      context "in none production env" do
        it "returns false" do
          foo.rails_env = "non-production"
          foo.send(:rails_env_production?).should be_false
        end
      end
    end

  end

  describe "#rails_env_development?" do

    it "is a private method" do
      should_be_private_method(:rails_env_development?)
    end

    context "without injected rails_env" do

      it "delegates to Rails.env.development?" do
        Rails.env.should_receive(:development?)
        foo.send(:rails_env_development?)
      end
    end

    context "with injected rails_env" do

      context "in development env" do
        it "returns true" do
          foo.rails_env = "development"
          foo.send(:rails_env_development?).should be_true
        end
      end

      context "in none development env" do
        it "returns false" do
          foo.rails_env = "non-development"
          foo.send(:rails_env_development?).should be_false
        end
      end
    end

  end

  describe "#rails_env_test?" do

    it "is a private method" do
      should_be_private_method(:rails_env_test?)
    end

    context "without injected rails_env" do

      it "delegates to Rails.env.test?" do
        Rails.env.should_receive(:test?)
        foo.send(:rails_env_test?)
      end
    end

    context "with injected rails_env" do

      context "in test env" do
        it "returns true" do
          foo.rails_env = "test"
          foo.send(:rails_env_test?).should be_true
        end
      end

      context "in none test env" do
        it "returns false" do
          foo.rails_env = "non-test"
          foo.send(:rails_env_test?).should be_false
        end
      end
    end

  end

  private

  def should_be_private_method(method_name)
    foo.private_methods(:false).map(&:to_s).should include(method_name.to_s)
  end

end