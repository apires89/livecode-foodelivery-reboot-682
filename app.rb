require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"

meal_repo = MealRepository.new(File.join(__dir__, 'data/meals.csv'))
meals_controller = MealsController.new(meal_repo)
router = Router.new(meals_controller)
router.run
