class Bike
  attr_reader :broken

  def working?
    broken ? false : true
  end

  def report_broken
    @broken = true
  end
end