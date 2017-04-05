module RockPaperScissorsNotLizardSpock
  RSpec.describe Throw do
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

    describe '.random_throw' do
      it 'throws rock, paper, or scissors' do
        expect(Throw.random_throw)
          .to satisfy { |throw| %w(rock paper scissors).include? throw }
      end
    end

    describe 'comparing throws' do
      context 'computer throws "rock"' do
        let(:computer_throw) { Throw.new 'rock' }

        describe '#beats?' do
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
        end

        describe 'tied?' do
          context 'human throws "rock"' do
            let(:player_throw) { Throw.new 'rock' }

            specify { expect(player_throw.tied?(computer_throw)).to be true }
            specify { expect(player_throw.beats?(computer_throw)).to be false }
          end
        end
      end
    end
  end
end