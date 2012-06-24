require "injectable_rails_env/version"

module InjectableRailsEnv

  SUPPORTED_ENVS = %w(test development production staging integration ci)

  def self.included(base)
    base.class_eval do
      attr_writer :rails_env

      include InstanceMethods
    end
  end

  module InstanceMethods

    private

    SUPPORTED_ENVS.each do |name|
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def rails_env_#{name}?
          !@rails_env.nil? ? (@rails_env == "#{name}") : Rails.env.#{name}?
        end
        private :rails_env_#{name}?
      EOS
    end

  end

end
