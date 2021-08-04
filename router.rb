require "byebug"
class Router
  def initialize(meals_controller,customers_controller,sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          router_manager_action
        else
          router_rider_action
        end
      end
    end
  end

  private

  def router_manager_action
    print_manager_menu
    choice = gets.chomp.to_i
    manager_action(choice)
  end

  def router_rider_action
    print_rider_menu
    choice = gets.chomp.to_i
    rider_action(choice)
  end

  def print_manager_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2- Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - List undeliverd orders"
    puts "6 - Add a new order"
    puts "7 - Logout"
    puts "8 - Quit"
    print "> "
  end



  def print_rider_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List my undeliverd Orders"
    puts "2 - Mark order as delivered!"
    puts "3 - Logout"
    puts "4 - Quit"
    print "> "
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 7 then logout!
    when 8 then stop!
    else
      puts "Try again..."
    end
  end

  def rider_action(choice)
    case choice
    when 1 then puts @orders_controller.list_my_undelivered_orders(@current_user)
    when 2 then puts @orders_controller.mark_as_delivered(@current_user)
    when 3 then logout!
    when 4 then stop!
    else
      puts "Try again..."
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    logout!
    @running = false
  end


end
