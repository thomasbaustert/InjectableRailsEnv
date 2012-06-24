class Job # < ActiveRecord::Base
  include InjectableRailsEnv

  def self.create(attrs)
    store[attrs[:id]] = attrs
  end

  def self.find(id)
    if rails_env_production?
      JobCache.find(id) || store[id]
    else
      store[id]
    end
  end

  private

  def self.store
    @store ||= {}
  end

end