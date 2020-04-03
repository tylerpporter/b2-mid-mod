class AmusementPark < ApplicationRecord

  has_many :rides

  def ordered
    rides.order(:name)
  end

end
