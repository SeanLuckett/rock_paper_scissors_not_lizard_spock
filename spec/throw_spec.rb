module RockPaperScissorsNotLizardSpock
  RSpec.describe Throw do
    describe '.random_throw' do
      it 'throws rock, paper, or scissors' do
        expect(Throw.random_throw)
          .to satisfy { |throw| %w(rock paper scissors).include? throw }
      end
    end
    it 'knows if it is legal' do
      player_throw = 'rock'
      throw = Throw.new(player_throw)
      expect(throw.legal?).to eq true
    end

    it 'knows if it is illegal' do
      player_throw = '23 skidoo'
      throw = Throw.new(player_throw)
      expect(throw.legal?).to eq false
    end

    describe 'comparing throws' do
      context 'computer throws "rock"' do
        let(:computer_throw) { Throw.new 'rock' }

        context 'human throws "paper"' do
          let(:player_throw) { Throw.new 'paper' }
          it 'returns true' do
            expect(player_throw.beats?(computer_throw)).to be true
          end
        end

        context 'human throws "scissors"' do
          let(:player_throw) { Throw.new 'scissors' }
          it 'returns false' do
            expect(player_throw.beats?(computer_throw)).to be false
          end
        end

        context 'human throws "rock"' do
          let(:player_throw) { Throw.new 'rock' }

          specify { expect(player_throw.beats?(computer_throw)).to be false }
          specify { expect(player_throw.tied?(computer_throw)).to be true }
        end
      end
    end
  end
end