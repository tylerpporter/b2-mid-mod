class AmusementPark < ApplicationRecord

  has_many :rides

  def ordered
    rides.order(:name)
  end

  def avg_thrill
    rides.average(:thrill_rating).round(2)
  end

end
