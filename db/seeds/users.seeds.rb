
class << self
  def create_user(opts)
      params = {password: "password", role: :view}.merge(opts)
      password = params[:password]
      name = params[:name]
      puts "creating #{name} with role #{params[:role]}"
       User.create(email:"#{name}@foobar.com", password:password, password_confirmation:password, role:params[:role])
  end
end


users = [
  {name:"admin", role: :admin},
  {name:"view", role: :view_only},
  {name:"security", role: :security}
]
users.each {|user| create_user(user)}
