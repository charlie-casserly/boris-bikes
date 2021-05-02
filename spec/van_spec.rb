require "van"

describe Van do
  it "collects broken bikes from a docking station" do
    bike1 = double(:bike, working?: true)
    bike2 = double(:bike, working?: true)
    bike3 = double(:bike, working?: false)
    bike4 = double(:bike, working?: true)
    bike5 = double(:bike, working?: false)
    station = double(:dockingstation, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.collect(station)
    expect(subject.bikes).to include(bike3, bike5)
  end

  it "returns fixed bikes to a docking station" do
    bike1 = double(:bike, working?: true)
    bike2 = double(:bike, working?: true)
    bike3 = double(:bike, working?: false)
    bike4 = double(:bike, working?: true)
    bike5 = double(:bike, working?: false)
    station = double(:station, bikes: [])

    subject.bikes = [bike1, bike2, bike3, bike4, bike5]
    subject.return_bikes(station)
    expect(station.bikes).to include(bike1, bike2, bike4)
  end

  it "takes broken bikes to a garage" do
    bike1 = double(:bike, working?: true)
    bike2 = double(:bike, working?: true)
    bike3 = double(:bike, working?: false)
    bike4 = double(:bike, working?: true)
    bike5 = double(:bike, working?: false)
    garage = double(:garage, bikes: [])

    subject.bikes = [bike1, bike2, bike3, bike4, bike5]
    subject.deposit(garage)
    expect(garage.bikes).to include(bike3, bike5)
  end

  it "collects fixed bikes from a garage" do
    bike1 = double(:bike, working?: true)
    bike2 = double(:bike, working?: true)
    bike3 = double(:bike, working?: false)
    bike4 = double(:bike, working?: true)
    bike5 = double(:bike, working?: false)
    garage = double(:garage, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.pick_up(garage)
    expect(subject.bikes).to include(bike1, bike2, bike4)
  end

end