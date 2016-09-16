class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, :length => { :minimum => 6 }

  has_many :boards
  has_many :games, :through => :boards

  def games_won
  	count = 0
    self.games.each do |game|
      if game.winner(self)
        count += 1
      end
    end
  	return count #has to return an integer
  end

  def win_loss_ratio
  	total = self.games.count
    wins = games_won
    ratio = (wins.to_f / total.to_f) * 100
    if ratio.nan?
      return 0
    else
      return ratio.round(2)	
    end#returns a decimal of win loss ratio
  end

  def total_shots_fired
    count = 1
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
    count = 0
    self.games.each do |game|
      count += game.total_hits(self)
    end
    if total_shots_fired == 0
      total = 1
    else
      total = total_shots_fired
    end
    accuracy = (count.to_f / total.to_f) * 100
  	return accuracy.round(2)  #returns a decimal of percent accuracy
  end
end
