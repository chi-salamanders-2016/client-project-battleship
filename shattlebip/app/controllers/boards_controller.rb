class BoardsController < ApplicationController

  def edit

    @boats = %w(carrier battleship cruiser submarine destroyer)

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
