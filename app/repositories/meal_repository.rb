require 'csv'
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository
  def parse_instance(row)
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
  end

  def store_instance(element,csv)
    csv << [element.id,element.name,element.price]
  end
end
