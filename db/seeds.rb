#create user
#@user_one= User.create(email: "demo@demo.com", name: "demo", password: "111111", password_confirmation: "111111", roles: :root_admin)
#puts "finish add user demo"

#set root_admin roles
#@user_one.roles = :root_admin
#@user_one.save

#puts "finish add root_admin role to demo"
@user = User.find_by(email: "wedding_two@demo.com")
#@user.roles = [:affair, :wedding_basic, :location, :carousel, :photograph, :consult, :top, :appointment, :recent, :home_photograph_category]
@user.roles = [:state, :official_account, :wedding_basic, :location, :tap_carousel, :tap_carousel_photograph, :menu, :movie, :top]
@user.save
