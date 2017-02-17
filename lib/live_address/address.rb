require_relative "api"
require 'delegate'

module LiveAddress
  # Public: Represents an Address in the LiveAddress API.
  class Address < SimpleDelegator
    # Public: All the method names available on a successful
    # response from the LiveAddress API.
    #
    # For a complete list, see:
    # http://smartystreets.com/kb/liveaddress-api/field-definitions
    DATA_NAMES = %w{
      primary_number
      street_predirection
      street_name
      street_suffix
      street_postdirection
      secondary_designator
      secondary_number
      city_name
      state_abbreviation
      zipcode
    }

    # Public: Find an address in the LiveAddress API.
    #
    # combined_address - The String address you want to validate.
    #
    # Examples:
    #
    #   address = LiveAddress::Address.find("1234 SW Lombard St, Portland OR 75632")
    #   address.primary_number
    #   # => 1234
    #   address.street_predirection
    #   # => SW
    #
    # Returns a LiveAddress::Address instance or nil.
    def self.find(combined_address)
      data = API.new.post("street-address", street: combined_address)
      (data.present?) ? Address.new(Hashie::Mash.new(data[:components])) : nil
    end

    # Public: The combined street information for the address.
    #
    # Examples
    #
    #   "5554 NW Secondary Blvd Apt 27"
    #   "332 Longboard Ave NE Ste 134"
    #   "44515 S Glisan Rd"
    #
    # Returns a String complete street address.
    def street
      [
        primary_number,
        street_predirection,
        street_name,
        street_suffix,
        street_postdirection,
        secondary_designator,
        secondary_number
      ].compact.join(" ")
    end

    # Public: The name of the city. (alias of #city_name)
    #
    # Returns a string or nil.
    def city
      city_name
    end

    # Public: The state name. (alias of #state_abbreviation)
    #
    # Returns a string or nil.
    def state
      state_abbreviation
    end

    # Public: The zip code. (alias of #zipcode)
    #
    # Returns a string or nil.
    def zip_code
      zipcode
    end

    # Public: Determine whether an Address instance
    # responds to a given method.
    #
    # Returns True if method is in DATA_NAMES.
    # Returns False if method is not in DATA_NAMES.
    def respond_to?(method_name)
      DATA_NAMES.include?(method_name) || super
    end

    # Public: Find and return an address value.
    # See DATA_NAMES for available methods.
    #
    # Returns a String if data is present.
    # Returns Nil of data is not present.
    def method_missing(method_name, *args)
      super
    rescue => exception
      nil
    end

    private
    # Internal: Log an Event tracking the fact that an
    # API call was made to the SmartyStreets LiveAddress
    # API.
    #
    # address - The address we searched the LiveAddress API for.
    #
    # Returns an Event instance.
    #def self.log_api_call(address)
      #Core::Event.create(
        #name: "live_address_api_call",
        #data: { address: address }
      #)
    #end
  end
end
