require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = []
  end

  def release_bike
    fail "No bike available" if @bike.empty?
    @bike
  end

  def dock(bike)
    fail "Dock at capacity" if @bike.length >= 20
    @bike << bike
  end
end