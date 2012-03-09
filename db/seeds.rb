# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.delete_all
count = 0
File.open("#{Rails.root}/db/qr_codes.txt", "r") do |infile|
  infile.each do |code|
    player = Player.create
    puts "Updating player: #{code}"
    Player.connection.execute("UPDATE players SET id = #{code} WHERE id = #{player.id}")
    count += 1
  end
end
puts "Updated #{count} players"