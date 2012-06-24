
# TODO 24.06.12/19:33/tbaustert

module InjectableRailsEnv

  def with_rails_env(klass, rails_env) do
    klass.rails_env = rails_env.to_s
    yield
  ensure
    klass.rails_env = nil
  end

end
