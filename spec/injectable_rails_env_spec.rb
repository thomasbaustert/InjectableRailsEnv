require 'spec_helper'
require File.expand_path "../../lib/injectable_rails_env", __FILE__

describe "InjectableRailsEnv" do

  class Foo
    include InjectableRailsEnv
  end

  let(:foo) { Foo.new }

  # maybe not the best idea to meta progam tests but I'm lazy here :)

  InjectableRailsEnv::SUPPORTED_ENVS.each do |name|

    describe "#rails_env_#{name}?" do

      it "is a private method" do
        foo.private_methods(:false).map(&:to_s).should include("rails_env_#{name}?")
      end

      context "without injected rails_env" do

        it "delegates to Rails.env.#{name}?" do
          Rails.env.should_receive("#{name}?")
          foo.send("rails_env_#{name}?")
        end
      end

      context "with injected rails_env" do

        context "in #{name} env" do
          it "returns true" do
            foo.rails_env = "#{name}"
            foo.send("rails_env_#{name}?").should be_true
          end
        end

        context "in none #{name} env" do
          it "returns false" do
            foo.rails_env = "non-#{name}"
            foo.send("rails_env_#{name}?").should be_false
          end
        end
      end

    end

  end

  InjectableRailsEnv::SUPPORTED_ENVS.each do |name|

    describe "::rails_env_#{name}?" do
      before(:each) { Foo.rails_env = nil }

      it "is a private method" do
        Foo.private_methods(:false).map(&:to_s).should include("rails_env_#{name}?")
      end

      context "without injected rails_env" do

        it "delegates to Rails.env.#{name}?" do
          Rails.env.should_receive("#{name}?")
          Foo.send("rails_env_#{name}?")
        end
      end

      context "with injected rails_env" do

        context "in #{name} env" do
          it "returns true" do
            Foo.rails_env = "#{name}"
            Foo.send("rails_env_#{name}?").should be_true
          end
        end

        context "in none #{name} env" do
          it "returns false" do
            Foo.rails_env = "non-#{name}"
            Foo.send("rails_env_#{name}?").should be_false
          end
        end
      end

    end

  end

end