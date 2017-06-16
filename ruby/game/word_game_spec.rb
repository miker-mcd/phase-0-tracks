require_relative 'word_game'

describe WordGame do
  let(:new_game) { WordGame.new("pizza") }

  it "splits secret word stored on initialization into letters" do
    expect(new_game.split_secret).to eq ["p","i","z","z","a"]
  end

  it "stores a letter in a guess container" do
    expect(new_game.guess_letter("a")).to eq ["a"]
  end
end