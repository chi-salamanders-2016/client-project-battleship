class Board < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :shots
  has_many :boats

  

  def get_or_init_fleet

    if !@fleet
      @fleet = Array.new
      fleet << Boat.new(:name => 'carrier', :length => 5)
      fleet << Boat.new(:name => 'battleship', :length => 4)
      fleet << Boat.new(:name => 'cruiser', :length => 2)
      fleet << Boat.new(:name => 'submarine', :length => 3)
      fleet << Boat.new(:name => 'destroyer', :length => 3)

    @fleet 
  end
end
