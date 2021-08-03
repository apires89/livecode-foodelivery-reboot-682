require_relative "../views/customers_view"


class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    #1. fetch all of the customers from the repository
    customers = @customer_repository.all
    #2. Display them (view)
    @customers_view.display(customers)
  end

  def create
    #1. Ask user for a name(view)
    name = @customers_view.ask_input("name")
    #2. Ask user for a address(view)
    address = @customers_view.ask_input("address")
    #3. Instante the customer(model)
    customer = Customer.new(name: name, address: address)
    #4. Store it in the repo(repository)
    @customer_repository.add(customer)
    #5. list
    list
  end



end
