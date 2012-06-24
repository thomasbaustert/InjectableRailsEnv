class JobCache

  def self.find(id)
    store[id]
  end

  def self.create(attrs)
    store[attrs[:id]] = attrs
  end

  private

  def self.store
    @store ||= {}
  end

end