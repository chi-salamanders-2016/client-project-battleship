User.create(username: "User1", email: "User1@gmail.com", password: "password1234")
User.create(username: "User2", email: "User2@gmail.com", password: "password1234")

Game.create(name: "Test Game")

Board.create(user_id: 1, game_id: 1)
Board.create(user_id: 2, game_id: 1)

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








