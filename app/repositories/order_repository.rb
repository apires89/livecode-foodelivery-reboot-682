require_relative "base_repository"
require_relative "../models/order"
require "byebug"

class OrderRepository < BaseRepository
  def initialize(csv_file,meal_repository,customer_repository,employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    super(csv_file)
    # @csv_file = csv_file
    # @elements = []
    # @next_id = 1
    # load_csv if File.exists?(@csv_file)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
  end


  def parse_instance(row)
    row[:id] = row[:id].to_i
    #convert the delivered row into a boolean
    row[:delivered] = row[:delivered] == "true"
    #go into each of the repositories and find the instances
    #with the right ids
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    #create the new instance and add it to @elements
    @elements << Order.new(row)
  end

  def store_instance(element,csv)
    csv << [element.id,element.delivered,element.meal.id,element.customer.id,element.employee.id]
  end

  def  my_undelivered_orders(user)
    @elements.select { |order| order.employee == user && !order.delivered?}
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end




end
