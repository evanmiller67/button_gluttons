Player.delete_all

File.open("#{Rails.root}/db/qr_codes.txt", "r") do |infile|
  count = 0
  infile.each_line do |code|
    code.chomp!
    print "Creating player '#{code}'..."
    player = Player.create(:first_name => "A", :last_name => "B", :email_address => "C")

    sql = "UPDATE players"
    sql << " SET id = #{code},"
    sql << "    first_name    = '',"
    sql << "    last_name     = '',"
    sql << "    email_address = ''"
    sql << " WHERE id = #{player.id}"
    Player.connection.execute sql
    puts "done"

    count += 1
  end
  puts "\nFinshed inserting #{count} players!  :)\n\n"
end
