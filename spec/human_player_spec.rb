module RockPaperScissorsNotLizardSpock
  RSpec.describe HumanPlayer do
    describe '#throw' do
      it 'makes a throw' do
        player = HumanPlayer.new
        player.make_throw('something')
        expect(player.throw).to be_kind_of Throw
      end
    end
  end
end