module LiveAddress
  # Public: Light API wrapper around the LiveAddress API.
  class API
    attr_accessor :sess

    # Public: Initializes a new instance of the API.
    def initialize
      @sess = Patron::Session.new
      @sess.base_url = "https://api.smartystreets.com"
      @sess.connect_timeout = 5
      @sess.timeout = 5
    end

    # Public: Post to a resource and return the first item
    # from the JSON array response as a Hash.
    #
    # resource - The String name of the resource to post to.
    # params   - The Hash of parameters to post.
    #
    # Returns a Hash if successful, nil if unsuccessful.
    def post(resource, params)
      response = @sess.post(resource_url(resource), "[#{params.to_json}]", "Content-Type" => "application/json")
      JSON.parse(response.body).try(:first).try(:symbolize_keys)
    rescue => exception
      nil
    end

    private
    # Internal: Compile a url for the resource passed,
    # including authentication credentials.
    #
    # resource - The String name of the resource.
    #
    # Examples:
    #
    #   resource_url("street-address")
    #   # => "/street-address?auth-id=<auth id>&auth-token=<auth token>"
    #
    # Returns String URL.
    def resource_url(resource)
      "/#{resource}?auth-id=#{LiveAddress.config.auth_id}&auth-token=#{LiveAddress.config.auth_token}"
    end
  end
end
