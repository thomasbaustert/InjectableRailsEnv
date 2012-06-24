require 'spec_helper'

describe Job do

  context "Rails env is production" do

    it "uses the cache" do
      JobCache.should_receive(:find).with(42)
      Job.rails_env = "production"

      Job.find(42)
    end
  end

  context "Rails env is non production" do

    it "not uses the cache" do
      puts Job.rails_env

      JobCache.should_not_receive(:find)
      Job.rails_env = "non-production"

      Job.find(42)
    end
  end

end