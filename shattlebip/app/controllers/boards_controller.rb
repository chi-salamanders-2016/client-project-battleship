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

  def create
    @board = Board.create!(board_params)
    redirect_to edit_game_board_path(@board.game, @board)
  end

  private
    def board_params
      params.require(:board).permit(:user_id, :game_id)
    end

end
