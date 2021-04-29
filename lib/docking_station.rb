require_relative 'bike'

class DockingStation
  attr_reader :bike
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike = []
    @capacity = capacity
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
    @bike.length >= @capacity
  end

  def dock_empty?
    @bike.empty?
  end
end

station = DockingStation.new 30