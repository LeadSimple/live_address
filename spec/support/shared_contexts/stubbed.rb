shared_context :stubbed do
  let(:response) { File.read(File.join(ROOT, 'spec', 'support', 'fixtures', 'address.json')) }

  before do
    stub_request(:post, "https://api.smartystreets.com/street-address?auth-id=test_auth_id&auth-token=test_auth_token").
    with(:body => "[{\"street\":\"33415 NE 165th Ave, Yacolt, Wa 98675\"}]",
         :headers => {'Content-Type'=>'application/json', 'Expect'=>''}).
    to_return(:status => 200, :body => response, :headers => {})
  end
end
