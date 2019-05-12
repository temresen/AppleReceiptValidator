# This code call the apple sandbox in app purchase server to validate a receipt using Ruby Code.
require 'net/http'
require 'uri'
require 'json'

receipt ='{
  "receipt-data": "***",
  "password": "***",
  "exclude-old-transactions": true
}'


uri = URI.parse('https://sandbox.itunes.apple.com/verifyReceipt')
req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
req.body = receipt
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
resp = http.request(req)
puts(resp.body)