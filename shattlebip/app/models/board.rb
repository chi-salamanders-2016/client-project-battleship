class Board < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :shots
  has_many :boats
end
