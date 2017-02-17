# LiveAddress
This gem provides a simple wrapper around the SmartyStreets [LiveAddress API](http://smartystreets.com/products/liveaddress-api).

## Example

``` ruby
LiveAddress.settings = {
  auth_id: "<YOUR AUTH ID HERE>",
  auth_token: "<YOUR AUTH TOKEN HERE>"
}

address = LiveAddress::Address.find('111 ne somers St vancouver WA 98662')
address.street # => "111 NE Sommers St" # Fixes typos
address.city # => "Vancouver"
address.state # => "WA"
address.zip_code # => "98662"
```
