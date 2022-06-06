require './lib/boat'

RSpec.describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20)
  end

  it "exists" do
    expect(@kayak).to be_a(Boat)
  end

  it "has a name" do
    expect(@kayak.type).to eql(:kayak)
  end

  it "has a cost" do
    expect(@kayak.price_per_hour).to eql(20)
  end

  it "has no hours rented" do
    expect(@kayak.hours_rented).to eql(0)
  end

  it "adds 3 hours" do
    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour
    expect(@kayak.hours_rented).to eql(3)
  end

end
