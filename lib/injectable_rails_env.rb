require "injectable_rails_env/version"

module InjectableRailsEnv

  def self.included(base)
    base.class_eval do
      attr_writer :rails_env

      include InstanceMethods
      extend ClassMethods
    end
  end

  module ClassMethods
    private

    def rails_env_production?
      !@rails_env.nil? ? (@rails_env == "production") : Rails.env.production?
    end
  end

  module InstanceMethods

    private

    def rails_env_production?
      !@rails_env.nil? ? (@rails_env == "production") : Rails.env.production?
    end

    def rails_env_development?
      !@rails_env.nil? ? (@rails_env == "development") : Rails.env.development?
    end

    def rails_env_test?
      !@rails_env.nil? ? (@rails_env == "test") : Rails.env.test?
    end
  end

end
