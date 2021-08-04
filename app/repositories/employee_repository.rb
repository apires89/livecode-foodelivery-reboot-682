require 'csv'
require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository
  def parse_instance(row)
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
  end

  def store_instance(element,csv)
    csv << [element.id,element.username,element.password,element.role]
  end

  def find_by_username(username)
    #returns the employee with this username
    @elements.find { |element| element.username == username }
  end

end
