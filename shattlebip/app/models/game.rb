class Game < ActiveRecord::Base
  has_many :boards
  has_many :users, through: :boards
  has_many :shots, through: :boards


  validates :name, presence: true
  #VALIDATIONS FOR ONLY 2 GAMES

  def user_board(user_id)
  	boards = self.boards
  	user_board = boards.select { |board| board.user_id == user_id }
  	user_board
  end

  def total_shots_for_game(user)
    boards = self.boards
    other_board = boards.select {|board| board.user_id != user.id}
    other_board = other_board[0]
    return other_board.shots.count
  end	

end
