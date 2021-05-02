class Van
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def collect(station)
    station.bikes.each { |bike| bikes << bike if !bike.working? }
  end

  def return_bikes(station)
    bikes.each { |bike| station.bikes << bike if bike.working? }
  end

  def deposit(garage)
    bikes.each { |bike| garage.bikes << bike if !bike.working? }
  end

  def pick_up(garage)
    garage.bikes.each { |bike| bikes << bike if bike.working? }
  end
end