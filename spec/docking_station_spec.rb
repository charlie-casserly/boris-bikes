require "docking_station"


describe DockingStation do
  let(:bike) { double :bike }

  describe 'initialization' do
    subject { DockingStation.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Dock at capacity'
    end
  end

  it {is_expected.to respond_to :release_bike}

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it "releases working bikes" do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it "raises an error when no bike available" do
      expect {subject.release_bike}.to raise_error('No bike available')
    end

    it "does not release broken bikes" do
      subject.dock double(:bike, working?: false)
      expect{subject.release_bike}.to raise_error('No working bikes available')
    end
  end

  describe '#dock' do
    it 'raises an error when dock with default capacity is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect {subject.dock(Bike.new)}.to raise_error('Dock at capacity')
    end

    it 'raises an error when dock with explicit capacity is full' do
      station = DockingStation.new 40
      station.capacity.times { station.dock double(:bike)}
      expect {station.dock(:bike)}.to raise_error('Dock at capacity')
    end

    it "docks bikes" do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.bikes).to include(bike)
    end
  
    it "docks multiple bikes" do
      bike1 = double(:bike)
      bike2 = double(:bike)
      bike3 = double(:bike)
  
      subject.dock(bike1)
      subject.dock(bike2)
      subject.dock(bike3)
  
      expect(subject.bikes).to include(bike1, bike2, bike3)
    end
  end
end

