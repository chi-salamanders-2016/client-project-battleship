class BoardsController < ApplicationController

  def edit
    @board = Board.find(params[:id])
    # if there are 5 boats for this board in the database, redirect to game view
    if @board.fleet_complete?
      redirect_to game_board_path

    else
      @boats = @board.get_or_init_fleet
    end
  end

  def show
    @board = Board.find(params[:id])
  end

end
