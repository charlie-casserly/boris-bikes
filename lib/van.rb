class Van
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def collect(station)
    station.bikes.delete_if do |bike| 
      bikes << bike if !bike.working?
    end
  end

  def return_bikes(station)
    bikes.delete_if do |bike|
      station.bikes << bike if bike.working?
    end
  end

  def deposit(garage)
    bikes.delete_if do |bike| 
      garage.bikes << bike if !bike.working?
    end 
  end

  def pick_up(garage)
    garage.bikes.delete_if do |bike| 
      bikes << bike if bike.working?
    end
  end
end