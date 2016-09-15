class BoardsController < ApplicationController

  def edit

    @boats = %w(carrier battleship cruiser submarine destroyer)

  end


end
