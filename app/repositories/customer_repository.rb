require 'csv'
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def parse_instance(row)
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
  end

  def store_instance(element,csv)
    csv << [element.id,element.name,element.address]
  end
end
