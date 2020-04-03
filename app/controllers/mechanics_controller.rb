class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update_rides
    ride = Ride.find(params[:ride_id])
    Mechanic.find(params[:id]).rides << ride
    redirect_to "/mechanics/#{params[:id]}"
  end

end
