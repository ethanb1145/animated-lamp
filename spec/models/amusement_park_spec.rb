require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  before(:each) do
    @mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
    @mechanic2 = Mechanic.create(name: "Cara Smith", years_experience: 12)
    @amusement_park = AmusementPark.create(name: 'Six Flags', admission_cost: 75)
    @ride = @amusement_park.rides.create(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create(name: "Swift", thrill_rating: 10, open: true)
    @ride3 = @amusement_park.rides.create(name: "Boom", thrill_rating: 9, open: true)
    MechanicRide.create(ride_id: @ride.id, mechanic_id: @mechanic.id)
    MechanicRide.create(ride_id: @ride3.id, mechanic_id: @mechanic2.id)
  end

  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe "#all_mechanics" do
    it "gives distinct list of all mechanics" do 
      expect(@amusement_park.all_mechanics).to eq([@mechanic, @mechanic2])
    end
  end
end