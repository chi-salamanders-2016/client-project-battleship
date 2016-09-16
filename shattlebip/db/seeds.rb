User.create(username: "Matt Baker", email: "User1@gmail.com", password: "password1234")
User.create(username: "Duke", email: "User2@gmail.com", password: "password1234")
User.create(username: "Derick", email: "User3@gmail.com", password: "password1234")
User.create(username: "Paul", email: "User4@gmail.com", password: "password1234")
User.create(username: "User5", email: "User5@gmail.com", password: "password1234")
User.create(username: "User6", email: "User6@gmail.com", password: "password1234")

Game.create(name: "Test Game")
Game.create(name: "Other Game")
Game.create(name: "DBC Game")
Game.create(name: "MY Game")
Game.create(name: "Game")
Game.create(name: "Other Game")

6.times do
  Game.create(name: "Test Game")
end

Board.create(user_id: 1, game_id: 1)
Board.create(user_id: 2, game_id: 1)
Board.create(user_id: 3, game_id: 2)
Board.create(user_id: 4, game_id: 2)
Board.create(user_id: 1, game_id: 3)
Board.create(user_id: 2, game_id: 3)
Board.create(user_id: 4, game_id: 4)
Board.create(user_id: 5, game_id: 4)
Board.create(user_id: 6, game_id: 5)
Board.create(user_id: 1, game_id: 5)
Board.create(user_id: 2, game_id: 6)
Board.create(user_id: 1, game_id: 6)
=======
Board.create(user_id: 1, game_id: 2)
Board.create(user_id: 2, game_id: 2)
Board.create(user_id: 1, game_id: 3)
Board.create(user_id: 2, game_id: 4)
Board.create(user_id: 1, game_id: 5)
Board.create(user_id: 2, game_id: 6)
>>>>>>> master

Boat.create(name: "Carrier", length: 5, bow_index: 64, stern_index: 69, board_id: 1)
Boat.create(name: "Battleship", length: 4, bow_index: 54, stern_index: 58, board_id: 1)
Boat.create(name: "Cruiser", length: 3, bow_index: 34, stern_index: 37, board_id: 1)
Boat.create(name: "Submarine", length: 3, bow_index: 24, stern_index: 27, board_id: 1)
Boat.create(name: "Destroyer", length: 2, bow_index: 14, stern_index: 16, board_id: 1)

Boat.create(name: "Carrier", length: 5, bow_index: 64, stern_index: 69, board_id: 2)
Boat.create(name: "Battleship", length: 4, bow_index: 54, stern_index: 58, board_id: 2)
Boat.create(name: "Cruiser", length: 3, bow_index: 34, stern_index: 37, board_id: 2)
Boat.create(name: "Submarine", length: 3, bow_index: 24, stern_index: 27, board_id: 2)
Boat.create(name: "Destroyer", length: 2, bow_index: 14, stern_index: 16, board_id: 2)

1000.times do
	Shot.create(board_id: rand(1..12), target_index:rand(1..99))
end








