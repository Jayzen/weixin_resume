#create user
@user= User.create(email: "demo@demo.com", name: "demo", password: "111111", password_confirmation: "111111", roles: :root_admin)
@user= User.create(email: "test@test.com", name: "test", password: "111111", password_confirmation: "111111", roles: :root_admin)
puts "finish add user demo"

#set root_admin roles
@user.roles = :root_admin
@user.save
puts "finish add root_admin role to demo"
