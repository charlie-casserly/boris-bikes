require "docking_station"
describe DockingStation do
  it "responds to release bike" do
    dock = DockingStation.new
    expect(dock).to respond_to(:release_bike)
  end
end

