class BoardsController < ApplicationController

  def edit

    @boats = Board.init_fleet

  end


end
