require_relative "../views/sessions_view"
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    #1. Ask user for username
    username = @sessions_view.ask_input("username")
    #2. Ask user for password
    password = @sessions_view.ask_input("password")
    #3. Find the specific employee(find the instance of employee)
    employee = @employee_repository.find_by_username(username)
    #4. return the employee if password is the correct password
    return employee if employee && employee.password == password
    #5. else pritn "Wrong Credentials"
    @sessions_view.print_wrong_credentials
    #6. call login again, go back to the start!
    login
  end


end
