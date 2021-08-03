class BaseView
  def display(elements)
    elements.each do |element|
      print_information(element)
    end
  end

  def ask_input(input)
    puts "What is the #{input}?"
    gets.chomp
  end

end
