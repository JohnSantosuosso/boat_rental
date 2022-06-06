require './lib/boat'
require './lib/renter'

RSpec.describe Renter do
  before(:each) do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  it "exists" do
    expect(@renter).to be_a(Renter)
  end

  it "has a name" do
    expect(@renter.name).to eql("Patrick Star")
  end

  it "has a credit card number" do
    expect(@renter.credit_card_number).to eql("4242424242424242")
  end

end
