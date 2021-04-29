require_relative 'bike'

class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20
  def initialize
    @bike = []
  end

  def release_bike
    fail "No bike available" if dock_empty?
    @bike
  end

  def dock(bike)
    fail "Dock at capacity" if dock_full?
    @bike << bike
  end

  private

  def dock_full?
    @bike.length >= DEFAULT_CAPACITY
  end

  def dock_empty?
    @bike.empty?
  end
end