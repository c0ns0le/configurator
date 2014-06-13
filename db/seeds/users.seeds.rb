
class << self
  def create_user(name, password = "password")
      puts "creating #{name}"
      User.create(email:"#{name}@foobar.com", password:password, password_confirmation:password)
  end
end


names = %w{admin view security}
names.each {|name| create_user(name)}
