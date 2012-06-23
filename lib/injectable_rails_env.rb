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
    # private ?
  end

  module InstanceMethods

    private

    %w(test development production stating integration ci).each do |name|
      class_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def rails_env_#{name}?
          !@rails_env.nil? ? (@rails_env == "#{name}") : Rails.env.#{name}?
        end
        private :rails_env_#{name}?
      EOS
    end

  end

end
