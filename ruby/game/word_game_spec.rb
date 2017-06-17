require_relative 'word_game'

describe WordGame do
  let(:new_game) { WordGame.new("pizza") }

  it "splits secret word stored on initialization into letters" do
    expect(new_game.split_secret).to eq ["p","i","z","z","a"]
  end

  it "stores a letter in a guess container" do
    expect(new_game.guess_letters("a")).to eq ["a"]
  end

  it "compares the last letter in guess container to each previous letter in the guess container" do
    expect(new_game.same_guess).to eq FALSE
  end

  it "compares the last letter in guess container with secret word letters" do
    expect(new_game.compare_letters).to eq TRUE
  end
end