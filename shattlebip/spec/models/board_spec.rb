require 'rails_helper'

describe Board do

  let(:board) { Board.new(user_id: 1, game_id: 1) }

  it "has a user_id" do
    expect(board.user_id).to eq 1
  end

  it "has a user_id" do
    expect(board.user_id).to eq 1
  end

end
