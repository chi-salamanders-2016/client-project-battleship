require 'rails_helper'

describe Game do

  let(:game) { Game.new }

  it "is a game object" do
    expect(game.class).to eq Game
  end
  

end
