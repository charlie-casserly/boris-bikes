require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "creates a bike object" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq [bike]
    end

    it "raises an error when no bike available" do
      expect {subject.release_bike}.to raise_error('No bike available')
    end
  end

  describe '#dock' do
    it 'raises an error when dock is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      #bike = Bike.new
      #subject.dock(bike)
      expect {subject.dock(Bike.new)}.to raise_error('Dock at capacity')
    end

    it 'raises an error when dock is full' do
      station = DockingStation.new 40

      station.capacity.times { station.dock(Bike.new)}

      expect {station.dock(Bike.new)}.to raise_error('Dock at capacity')
    end
  end

  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq [bike]
  end
end

