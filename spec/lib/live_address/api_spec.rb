require "spec_helper"

describe LiveAddress::API do
  include_context :configured

  its(:sess) { should be_a Patron::Session }
  its('sess.base_url') { should eq 'https://api.smartystreets.com' }

  describe "#post" do
    include_context :stubbed
    let(:api) { described_class.new }

    it "returns a hash" do
      address = "33415 NE 165th Ave, Yacolt, Wa 98675"
      result = api.post('street-address', { street: address })
      expect(result).to be_a Hash
    end
  end
end
