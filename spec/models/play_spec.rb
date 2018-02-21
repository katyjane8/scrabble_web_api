require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end
      
      it "scores the second word" do
        play = create(:play, word: "hello")
        expect(play.score).to eq(8)
      end
    end
  end
end
