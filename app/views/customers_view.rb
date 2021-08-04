require_relative "base_view"

class CustomersView < BaseView
  def print_information(element)
    puts "#{element.id} - #{element.name} - #{element.address}"
  end
end
