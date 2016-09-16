class BoardsController < ApplicationController

  def edit
    @board = Board.find(params[:id])

    @boats = @board.get_or_init_fleet

  end


end
