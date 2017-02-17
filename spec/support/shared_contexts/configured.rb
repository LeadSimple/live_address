shared_context :configured do
  let(:configure) do
    Proc.new {
      LiveAddress.configure do |config|
        config.auth_id = 'test_auth_id'
        config.auth_token = 'test_auth_token'
      end
    }
  end

  before { configure.call }
end
