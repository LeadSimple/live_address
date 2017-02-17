require "spec_helper"

describe LiveAddress do
  include_context :configured

  describe ".configure" do
    it "sets @@auth_id and @@auth_token" do
      configure.call
      expect(LiveAddress.config.auth_id).to eq 'test_auth_id'
      expect(LiveAddress.config.auth_token).to eq 'test_auth_token'
      LiveAddress.clear_config
    end
  end
end
