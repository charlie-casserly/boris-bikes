require "docking_station"

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
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
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when no bike available" do
      expect {subject.release_bike}.to raise_error('No bike available')
    end
  end

  describe '#dock' do
    it 'raises an error when dock with default capacity is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }

      expect {subject.dock(Bike.new)}.to raise_error('Dock at capacity')
    end

    it 'raises an error when dock with explicit capacity is full' do
      station = DockingStation.new 40

      station.capacity.times { station.dock(Bike.new)}

      expect {station.dock(Bike.new)}.to raise_error('Dock at capacity')
    end

    it "docks bikes" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
  
    it "docks multiple bikes" do
      bike1 = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
  
      subject.dock(bike1)
      subject.dock(bike2)
  
      expect(subject.dock(bike3)).to eq [bike1, bike2, bike3]
    end
  end
end

