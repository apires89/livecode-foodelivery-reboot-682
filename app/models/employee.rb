class Employee
  attr_accessor :id
  attr_reader :username,:password,:role
  def initialize(attributes={})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
  end

  def manager?
    @role == "manager"
  end


  def self.headers
    #creating a class method that can be called like this ---->  Employee.headers
    ["id","username","password"]
  end


end
