require_relative "base_view"
class OrdersView < BaseView
  def print_information(element)
    delivered = element.delivered? ? "[X]" : "[ ]"
    puts "#{delivered} - #{element.id} - meal: #{element.meal.name} - customer:#{element.customer.name} - rider: #{element.employee.username} "
  end

  def ask_for_index
    puts "What is the index?"
    gets.chomp.to_i
  end
end
