class Game < ActiveRecord::Base
  has_many :boards
  has_many :users, through: :boards
  has_many :shots, through: :boards

  #VALIDATIONS FOR ONLY 2 GAMES

  def total_shots_for_game(user)
    boards = self.boards
    other_board = boards.select {|board| board.user_id != user.id}
    other_board = other_board[0]
    return other_board.shots.count
  end	

end
