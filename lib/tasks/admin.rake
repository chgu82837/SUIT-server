namespace :admin do
  desc "Create an Admin User"
  task create: :environment do
    puts "==========================="
    puts "Creating an admin user ..."
    while true
      begin
        print "Email: "
        email = $stdin.gets.strip!
        print "Password (Will be displayed!): "
        pw = $stdin.gets.strip!

        admin = User.new(
          email: email,
          password: pw,
          password_confirmation: pw,
          is_admin: true
        )
        admin.save!
        puts "Admin created!"
        p admin
        break
      rescue => e
        p e
      end
    end
  end

end
