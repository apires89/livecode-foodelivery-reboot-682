class Customer
  attr_accessor :id
  attr_reader :name,:address
  def initialize(attributes={})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end

  def self.headers
    #creating a class method that can be called like this ---->  Customer.headers
    ["id","name","address"]
  end
end
