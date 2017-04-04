module RockPaperScissorsNotLizardSpock
  RSpec.describe HumanPlayer do
    describe '#throw' do
      context 'legal throw' do
        it 'records the throw' do
          throw_choice = "rock\n"
          allow(STDIN).to receive(:gets) { throw_choice }
          player = HumanPlayer.new
          throw = player.make_throw
          expect(throw.choice).to eq throw_choice.chomp
        end
      end
    end
  end
end