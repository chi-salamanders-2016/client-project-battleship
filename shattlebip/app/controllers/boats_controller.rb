class BoatsController < ApplicationController

  def create
    @boat = Boat.new(boat_params)

    if @boat.save
      flash[:notice] = "#{@boat.name} successfully created"
    else
      flash[:alert] = "there was a problem. please try to create #{@boat.name} again."
    end

    redirect_to :back 
  end

  private
  def boat_params
    params.require(:boat).permit(:board_id, :name, :length, :bow_index, :stern_index)
  end 

end
