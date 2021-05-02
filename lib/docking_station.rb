require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_accessor :capacity
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bike available" if dock_empty?
    counter = -1
    while counter < bikes.length
      fail "No working bikes available" if bikes[counter] == nil
      if bikes[counter].working?
        return bikes.delete_at(counter)
      end
      counter += -1
    end
  end

  def dock(bike)
    fail "Dock at capacity" if dock_full?
    bikes << bike
  end

  private

  def dock_full?
    bikes.length >= capacity
  end

  def dock_empty?
    bikes.empty?
  end
end