class Order
  attr_accessor :id
  attr_reader :customer,:meal,:employee, :delivered
  def initialize(attributes={})
    @customer = attributes[:customer]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
    @id = attributes[:id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def self.headers
    #creating a class method that can be called like this ---->  Order.headers
    ["id","delivered","meal_id","customer_id","employee_id"]
  end


end
