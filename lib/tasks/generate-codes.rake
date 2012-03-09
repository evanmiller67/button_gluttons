#!/usr/bin/env ruby
require 'net/https'
require 'uri'

# Number of QRs to generate
num_qrs = 550
qr_size = "500x500"

namespace :qr do
  desc "Generate QR codes"
  task :generate => :environment do
    # Create a place to put the QR code images
    file_prefix = "#{Rails.root}/app/assets/images/qr_codes"

    # Clean up all the old things
    FileUtils::rmtree(file_prefix) if FileTest::directory?(file_prefix)
    FileUtils::mkdir(file_prefix)
    # ... and the database ...
    Player.delete_all
    

    i = 0
    qr = Hash.new
    # Generate QR codes
    while i < num_qrs
      # s=rand(36**5).to_s(36)
      s = rand(1e10).to_s
      if s !~ /(.)\1/ # No period in name
        if (!(qr.any?{|k,v| k.include? s}) && s.length == 10) # Make sure not already generated and 5 chars long
          qr["#{s}"] = 1
          i += 1
        end
      end
    end

    # Make google generate the QR code
    # escape the URI
    url = Rails.env == "production" ? "http://buttongluttons.com/players/" : "http://localhost:3000/players/"
    request = "/chart?cht=qr&chs=#{qr_size}&chl="
    request << URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
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
            file_path = "#{file_prefix}/#{key}.png"
            open(file_path, "wb") do |file|
             file.write(res.body)
             puts "QR Generated: " + file_path
            end
        }
      }

      # Insert a new player with the same ID as the QR code
      player = Player.create
      # BTW: This is EVIL and you should never do this!  Do as I say and not as I do!  :/
      Player.connection.execute("UPDATE players SET id = #{key} WHERE id = #{player.id}")
    end
  end
end