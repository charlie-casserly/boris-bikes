require_relative 'bike'

class DockingStation
  attr_reader :bike

  def bike
    @bike
  end

  def release_bike
    fail "No bike available" unless @bike
    @bike
  end

  def dock(bike)
    fail "Dock at capacity" if @bike
    @bike = bike
  end
end