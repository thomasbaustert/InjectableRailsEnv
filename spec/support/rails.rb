##
# simulate Rails to avoid loading full Rails environment
#
class Rails

  class RailsEnv
    # return value not important here
    def production?; end
    def development?; end
    def test?; end
  end

  @@env = RailsEnv.new
  def self.env; @@env; end

  @@version = "3.2.6"
  def self.version=(v); @@version = v; end
  def self.version; @@version; end

end
