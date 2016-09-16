class Game < ActiveRecord::Base
  has_many :boards
  has_many :users, through: :boards
  has_many :shots, through: :boards


  validates :name, presence: true
  #VALIDATIONS FOR ONLY 2 GAMES

  def total_shots_for_game(user)
    boards = self.boards
    other_board = boards.select {|board| board.user_id != user.id}[0]
    return other_board.shots.count
  end	

  def total_hits(user)
  	counter = 0
  	boards = self.boards
    other_board = boards.select {|board| board.user_id != user.id}[0]
    other_board.shots.each do |shot|
    	other_board.boats.each do |boat|
    		if boat.cells.include?(shot.target_index)
    			counter += 1
    		end
    	end
    end
    return counter 
  end

  def winner(user)
  	if total_hits(user) >= 17
  		return true
  	end
  end

end
