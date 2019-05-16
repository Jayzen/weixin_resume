#create user
User.create(email: "demo@demo.com", name: "demo", password: "111111", password_confirmation: "111111", confirmed_at: "2018-12-12",roles: :root_admin)
puts "finish add user demo"

#set root_admin roles
@user = User.first
@user.roles = :root_admin
@user.save
puts "finish add root_admin role to demo"
