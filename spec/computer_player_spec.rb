module RockPaperScissorsNotLizardSpock
  RSpec.describe ComputerPlayer do
    describe '#throw' do
      it 'can make a throw' do
        player = ComputerPlayer.new
        player.make_throw
        expect(player.throw).to be_kind_of Throw
      end

      it 'only makes legal throws' do
        throw = ComputerPlayer.new.throw
        expect(throw.legal?).to be_truthy
      end
    end
  end
end