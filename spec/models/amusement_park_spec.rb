require 'rails_helper'

RSpec.describe AmusementPark do

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods' do
    park1 = AmusementPark.create(name: "Fun Town", admission: "$50.00")
    ride1 = park1.rides.create(name: "Barf-O-Whirl", thrill_rating: 8)
    ride2 = park1.rides.create(name: "Upchuck Bomb", thrill_rating: 9)
    ride3 = park1.rides.create(name: "Spew-Go_Round", thrill_rating: 6)

    it 'ordered' do

      expect(park1.ordered).to eq([ride1, ride3, ride2])
    end

  end
end
