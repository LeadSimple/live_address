require "patron"
require "hashie"
require "active_support"
require "active_support/core_ext/object/json"
require "active_support/core_ext/hash/keys"
require "live_address/config"
require "live_address/api"
require "live_address/address"

module LiveAddress
  def self.configure
    yield self.config
    self.config
  end

  def self.config
    @@config ||= Config.new
  end

  def self.clear_config
    @@config = Config.new
  end
end
