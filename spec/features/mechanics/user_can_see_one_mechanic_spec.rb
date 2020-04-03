require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @park1 = AmusementPark.create(name: "Fun Town", admission: "$50.00")
    @ride1 = @park1.rides.create(name: "Barf-O-Whirl", thrill_rating: 8)
    @ride2 = @park1.rides.create(name: "Upchuck Bomb", thrill_rating: 9)
    @ride3 = @park1.rides.create(name: "Spew-Go_Round", thrill_rating: 6)
    @mech1 = Mechanic.create(name: "Bob", yrs_exp: 5)
    MechanicRide.create(ride: @ride1, mechanic: @mech1)
    MechanicRide.create(ride: @ride2, mechanic: @mech1)
    visit "/mechanics/#{@mech1.id}"
  end
describe 'When I visit /mechanics/:id'
  it 'I see that mechanics info including names of rides they are working on' do

    expect(page).to have_content("Mechanic: #{@mech1.name}")
    expect(page).to have_content("Years of Experience: #{@mech1.yrs_exp}")
    expect(page).to have_content("Current rides they're working on:")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@ride3.name)
  end
  it 'I see a form to add a ride to that mechanics workload' do

    expect(page).to have_content("Add a ride to workload:")
    expect(page).to_not have_content(@ride3.name)

    fill_in :ride_id, with: @ride3.id
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{@mech1.id}")
    expect(page).to have_content(@ride3.name)
  end

end
