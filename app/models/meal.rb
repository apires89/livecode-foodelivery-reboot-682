class Meal
  attr_accessor :id
  attr_reader :name,:price
  def initialize(attributes={})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end

  def self.headers
    #creating a class method that can be called like this ---->  Meal.headers
    ["id","name","price"]
  end


end
