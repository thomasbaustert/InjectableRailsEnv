require "injectable_rails_env/version"

module InjectableRailsEnv

  SUPPORTED_ENVS = %w(test development production staging integration ci)

  def self.included(base)
    base.class_eval do
      attr_writer :rails_env

      include InstanceMethods
      extend ClassMethods
    end
  end

  module ClassMethods

    class_eval(<<-EOS, __FILE__, __LINE__ + 1)
      unless defined? @@rails_env
        @@rails_env = nil
      end

      def rails_env=(e)
        @@rails_env = e
      end

      def rails_env
        @@rails_env
      end
    EOS

    SUPPORTED_ENVS.each do |name|
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def rails_env_#{name}?
          !@@rails_env.nil? ? (@@rails_env == "#{name}") : Rails.env.#{name}?
        end
        private :rails_env_#{name}?
      EOS
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
