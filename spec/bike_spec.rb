require "bike"

describe Bike do
  it "responds to working" do
    expect(subject).to respond_to(:working?)
  end

  it "responds to broken" do
    expect(subject).to respond_to(:broken)
  end

  it "allows bikes to be reported broken" do
    subject.report_broken
    expect(subject.broken).to eq true
  end
end