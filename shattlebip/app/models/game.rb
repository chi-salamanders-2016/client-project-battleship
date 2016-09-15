class Game < ActiveRecord::Base
  has_many :boards
  has_many :users, through: :boards

  #VALIDATIONS FOR ONLY 2 GAMES


end
