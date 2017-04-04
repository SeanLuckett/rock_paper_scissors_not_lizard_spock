module RockPaperScissorsNotLizardSpock
  RSpec.describe Game do
    let(:presenter) { spy('GamePresenter') }
    let(:game) { Game.new(presenter: presenter) }

    describe 'starting the game' do
      before :each do
        allow(STDIN).to receive(:gets).and_return("1\n", "paper\n")
      end

      it 'welcomes the player' do
        game.play
        expect(presenter).to have_received(:welcome)
      end

      it 'presents player with the game rules' do
        game.play
        expect(presenter).to have_received(:rules)
      end

      it 'presents the ui menu' do
        game.play
        expect(presenter).to have_received(:play_options)
      end

      context 'player plays' do
        it 'prompts player to make a throw' do
          game.play
          expect(presenter).to have_received(:player_prompt)
          expect(presenter).not_to have_received(:quit)
        end
      end

      context 'player quits' do
        it 'quits the game' do
          allow(STDIN).to receive(:gets).and_return("2\n")

          game.play
          expect(presenter).to have_received(:quit)
        end
      end

    end

    describe 'scoring the game' do
      context 'computer throws "rock"' do
        let(:computer) do
          allow_any_instance_of(ComputerPlayer)
            .to receive(:make_throw) { 'rock' }
          ComputerPlayer.new
        end

        context 'human throws "paper"' do
          before do
            allow(STDIN).to receive(:gets).and_return('paper')
          end

          xit 'tells the player they won' do
            game.play

            expect(presenter).to have_received(:win)
          end
        end
      end
    end
  end
end
