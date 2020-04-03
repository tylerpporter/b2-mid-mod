require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @park1 = AmusementPark.create(name: "Fun Town", admission: "$50.00")
    @ride1 = @park1.rides.create(name: "Barf-O-Whirl", thrill_rating: 8)
    @ride2 = @park1.rides.create(name: "Upchuck Bomb", thrill_rating: 9)
    @ride3 = @park1.rides.create(name: "Spew-Go_Round", thrill_rating: 6)
    visit "/parks/#{@park1.id}"
  end
describe 'When I visit /parks/:id'
  it 'I see the name and price of admission for that amusement park' do

    expect(page).to have_content(@park1.name)
    expect(page).to have_content("Admissions: #{@park1.admission}")
  end
  it 'I see all of the rides that are at that theme park' do

    expect(page).to have_content("Rides:")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    @ride1.name.should appear_before(@ride3.name)
    @ride1.name.should appear_before(@ride2.name)
    @ride3.name.should appear_before(@ride2.name)
    expect(page).to have_content("Average Thrill Rating of Rides: #{@park1.avg_thrill}/10")
  end

end
