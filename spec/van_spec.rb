require "van"

describe Van do
    let(:bike1) { double(:bike, working?: true) }
    let(:bike2) { double(:bike, working?: true) }
    let(:bike3) { double(:bike, working?: false) }
    let(:bike4) { double(:bike, working?: true) }
    let(:bike5) { double(:bike, working?: false) }

  it "collects broken bikes from a docking station" do
    station = double(:dockingstation, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.collect(station)
    expect(subject.bikes).to include(bike3, bike5)
  end

  it "collects broken bikes from a docking station" do
    station = double(:dockingstation, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.collect(station)
    expect(subject.bikes).to include(bike3, bike5)
  end

  it "returns fixed bikes to a docking station" do
    station = double(:station, bikes: [])
    subject.bikes = bike1, bike2, bike3, bike4, bike5
    subject.return_bikes(station)
    expect(station.bikes).to include(bike1, bike4, bike2)
  end

  it "remove bikes from van after returning to a docking station" do
    station = double(:station, bikes: [])
    subject.bikes = [bike1, bike2, bike3, bike4, bike5]
    subject.return_bikes(station)
    expect(subject.bikes).to_not include(bike1, bike4, bike2)
  end

  it "takes broken bikes to a garage" do
    garage = double(:garage, bikes: [])
    subject.bikes = [bike1, bike2, bike3, bike4, bike5]
    subject.deposit(garage)
    expect(garage.bikes).to include(bike3, bike5)
  end

  it "removes bikes from van after being taken to a garage" do
    garage = double(:garage, bikes: [])
    subject.bikes = [bike1, bike2, bike3, bike4, bike5]
    subject.deposit(garage)
    expect(subject.bikes).to_not include(bike3, bike5)
  end

  it "collects fixed bikes from a garage" do
    garage = double(:garage, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.pick_up(garage)
    expect(subject.bikes).to include(bike1, bike2, bike4)
  end

  it "removes bikes from garage after collected" do
    garage = double(:garage, bikes: [bike1, bike2, bike3, bike4, bike5])
    subject.pick_up(garage)
    expect(garage.bikes).to_not include(bike1, bike2, bike4)
  end

end