require_relative "../views/orders_view"
require "byebug"
class OrdersController
  def initialize(meal_repo,customer_repo,employee_repo,orders_repo)
    @meal_repo = meal_repo
    @employee_repo = employee_repo
    @customer_repo = customer_repo
    @orders_repo = orders_repo
    @meals_view = MealsView.new
    @sessions_view = SessionsView.new
    @customers_view = CustomersView.new
    @orders_view = OrdersView.new
  end

  def list
    @orders_view.display(@orders_repo.all)
  end

  def list_undelivered_orders
    #go to the repo and select only the ones with delivered false
    orders = @orders_repo.undelivered_orders
    #display them
    @orders_view.display(orders)
  end



  def add
    #1. need a meal
    meal = select_meal
    #2. need a customer
    customer = select_customer
    #3. need employee
    employee = select_employee
    #4. instantiate a new order
    order = Order.new(meal: meal,customer: customer, employee: employee)
    #5. add new order to repo
    @orders_repo.add(order)
    #6. Display orders
    list
  end

  def mark_as_delivered(current_user)
    list_my_undelivered_orders(current_user)
    index = @orders_view.ask_for_index
    my_orders = @orders_repo.my_undelivered_orders(current_user)
    order = my_orders[index - 1]
    @orders_repo.mark_as_delivered(order)
  end



  def list_my_undelivered_orders(user)
    orders = @orders_repo.my_undelivered_orders(user)
    @orders_view.display(orders)
  end

  private


  def select_meal
    #1. meal repository and fetch @meals
    meals = @meal_repo.all
    #2. Display the available meals to the user
    @meals_view.display(meals)
    #3. select one of the meals
    index = @orders_view.ask_for_index
    #4. return the correct meal
    return meals[index]
  end
  def select_employee
    #1. employee repository and fetch @employees
    employees = @employee_repo.all
    #2. Display the available employees to the user
    @sessions_view.display(employees)
    #3. select one of the employees
    index = @orders_view.ask_for_index
    #4. return the correct employee
    return employees[index - 1]
  end

  def select_customer
    #1. customer repository and fetch @customers
    customers = @customer_repo.all
    #2. Display the available customers to the user
    @customers_view.display(customers)
    #3. select one of the customers
    index = @orders_view.ask_for_index
    #4. return the correct customer
    return customers[index]
  end



end
