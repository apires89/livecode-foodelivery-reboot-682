require_relative "base_view"
class MealsView < BaseView
  def print_information(element)
    puts "#{element.id} - #{element.name} - #{element.price}"
  end
end
