require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @mech1 = Mechanic.create(name: "Bob", yrs_exp: 5)
    @mech2 = Mechanic.create(name: "Jeff", yrs_exp: 12)
    @mech3 = Mechanic.create(name: "Sally", yrs_exp: 9)
  end
describe 'When I visit /mechanics'
  it 'I see a list of all mechanics and their info' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mech1.name)
    expect(page).to have_content(@mech2.name)
    expect(page).to have_content(@mech3.name)

    within "#mechanic-#{@mech1.id}" do
      expect(page).to have_content("#{@mech1.yrs_exp} years of experience")
    end
  end

end
