#!/usr/bin/env ruby
require 'net/https'
require 'uri'

# Number of QRs to generate
num_qrs = 500
qr_size = "500x500"

i = 0
qr = Hash.new
# Generate QR codes
while i < num_qrs
  s=rand(36**5).to_s(36)
  if s !~ /(.)\1/ # No period in name
    if (!(qr.any?{|k,v| k.include? s}) && s.length == 5) # Make sure not already generated and 5 chars long
      qr["#{s}"] = 1
      i += 1
    end
  end
end

# Make google generate the QR code
# escape the URI
request = "/chart?cht=qr&chs=#{qr_size}&chl=" + URI.escape("http://buttongluttons.com/qr/", Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
gapi = "https://chart.googleapis.com"
uri = URI.parse(gapi)

qr.each_key do |key|
  # Request 500x500 QR for key
  full_request = request + key

  # Make HTTPS connection to gapi
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.start {
    # Actually get the QR
    http.request_get(full_request) {|res|
        # Save the image
        file_path = "#{key}.png"
        open(file_path, "wb") do |file|
         file.write(res.body)
         puts "QR Generated: " + file_path
        end
    }
  }
end