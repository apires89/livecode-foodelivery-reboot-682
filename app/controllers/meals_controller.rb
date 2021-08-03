require_relative "../views/meals_view"


class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    #1. fetch all of the meals from the repository
    meals = @meal_repository.all
    #2. Display them (view)
    @meals_view.display(meals)
  end

  def create
    #1. Ask user for a name(view)
    name = @meals_view.ask_input("name")
    #2. Ask user for a price(view)
    price = @meals_view.ask_input("price").to_i
    #3. Instante the meal(model)
    meal = Meal.new(name: name, price: price)
    #4. Store it in the repo(repository)
    @meal_repository.add(meal)
    #5. list
    list
  end



end
