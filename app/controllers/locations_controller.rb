class LocationsController < ApplicationController

  def create

    @location = Location.new(address:params[:location][:address], user_id:current_user.id)
    if @location.save
      redirect_to root_path, notice: 'Successfully address has been set !'
    else
      redirect_to root_path, notice: "Sorry we couldn't set your address"
    end
  end

  def update
    if params[:location][:address] == current_user.location.address
      redirect_to root_path, notice: "Sorry we couldn't update your address"
    end

    @location = Location.find(params[:id])
    if @location.update(address_params)
      redirect_to root_path, notice: 'Successfully updated !'
    else
      redirect_to root_path, notice: "Sorry we couldn't update your address"
    end
  end

  private

  def address_params
    params.require(:location).permit(:address)
  end

end
