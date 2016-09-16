class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, :length => { :minimum => 6 }

  has_many :boards
  has_many :games, :through => :boards

  def games_won
  	#change this later to actual method of calculating games won
  	return 10 #has to return an integer
  end

  def win_loss_ratio
  	#change this later to acutal method
  	return 48.5	#returns a decimal of win loss ratio
  end

  def total_shots_fired
    count = 0
    self.games.each do |game|
      count += game.total_shots_for_game(self)
    end
		#boards = self.boards
    #boards.each do |board|
    #  count += board.shots.count
    #end
		return count  #has to return an integer
  end

  def calculate_accuracy
  	#change this later to acutal method of calculating accuracy
  	return 3.5 #returns a decimal of percent accuracy
  end
end
