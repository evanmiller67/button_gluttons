Player.delete_all

File.open("#{Rails.root}/db/qr_codes.txt", "r") do |infile|
  infile.each_with_index do |code, index|
    code.chomp!
    print "Creating player '#{code}'..."
    player = Player.create

    Player.connection.execute "UPDATE players SET id = #{code} WHERE id = #{player.id}"
    puts "done"
  end
  puts "\nFinshed inserting #{infile.size} players!  :)\n\n"
end
