require_relative 'boat'
require_relative 'renter'
require_relative 'dock'

class Dock
  attr_reader :name, :max_rental_time
  attr_accessor :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    boat_charges = Hash.new
    boat_charges[:card_number] = @rental_log[boat].credit_card_number
    boat_charges[:amount] =     calculate_total_cost(boat)
    boat_charges
  end

  def calculate_total_cost(boat)
    total_cost = boat.price_per_hour * boat.hours_rented
    max_cost = boat.price_per_hour * @max_rental_time
    total_cost > max_cost ? max_cost : total_cost
  end


end
