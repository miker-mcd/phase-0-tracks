require_relative 'word_game'

describe WordGame do
  # let(:secret_word) { WordGame.new("word") }

  it "splits word into letters" do
    secret_word = WordGame.new
    expect(secret_word.split_secret("word")).to eq ["w","o","r","d"]
  end

end