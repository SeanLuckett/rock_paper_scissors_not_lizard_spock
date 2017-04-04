module RockPaperScissorsNotLizardSpock
  class Game
    attr_accessor :round_count, :player_score, :computer_score

    def initialize
      @round_count = 0
      @player_score = 0
      @computer_score = 0
    end
  end

  RSpec.describe Game do
    describe 'initial attributes' do
      it { is_expected.to have_attributes(round_count: 0) }
      it { is_expected.to have_attributes(player_score: 0) }
      it { is_expected.to have_attributes(computer_score: 0) }
    end
  end
end
