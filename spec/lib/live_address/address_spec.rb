require "spec_helper"

describe LiveAddress::Address do
  include_context :configured
  include_context :stubbed

  describe ".find" do
    it "identifies an address and normalizes it" do
      address = described_class.find('33415 NE 165th Ave, Yacolt, Wa 98675')
      expect(address.street).to eq('33415 NE 165th Ave')
      expect(address.city).to eq('Yacolt')
      expect(address.state).to eq('WA')
      expect(address.zip_code).to eq('98675')
    end
  end
end
