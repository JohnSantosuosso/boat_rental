require './lib/boat'
require './lib/renter'
require './lib/dock'
require 'pry'

RSpec.describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  it "exists" do
    expect(@dock).to be_a(Dock)
  end

  it "has a name" do
    expect(@dock.name).to eql("The Rowing Dock")
  end

  it "has a max_rental_time" do
    expect(@dock.max_rental_time).to eql(3)
  end

  it "rents boats to renters" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    expect(@dock.rental_log[@kayak_1]).to eql(@patrick)
    expect(@dock.rental_log[@kayak_2]).to eql(@patrick)
    expect(@dock.rental_log[@sup_1]).to eql(@eugene)
  end

  it "chargers a renter based on the boat" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
    binding.pry
    @kayak_1.add_hour
    @kayak_1.add_hour
    expect(@dock.charge(@kayak_1)).to eql({:card_number => "4242424242424242",:amount => 40})
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    expect(@dock.charge(@sup_1)).to eql({:card_number => "1313131313131313",:amount => 45})
  end



end
