module RockPaperScissorsNotLizardSpock
  RSpec.describe Game do
    let(:presenter) { spy('GamePresenter') }

    describe 'starting the game' do
      let(:game) { Game.new(presenter: presenter) }

      before :each do
        allow(STDIN).to receive(:gets).and_return("1\n", "paper\n")
        game.play
      end

      it 'welcomes the player' do
        expect(presenter).to have_received(:welcome)
      end

      it 'presents player with the game rules' do
        expect(presenter).to have_received(:rules)
      end

      it 'presents the ui menu until player chooses not to play' do
        expect(presenter).to have_received(:play_options).twice
      end

      context 'player plays' do
        it 'shows the score' do
          expect(presenter).to have_received(:score)
        end

        it 'prompts player to make a throw' do
          expect(presenter).to have_received(:player_prompt)
        end
      end

      context 'player quits' do
        it 'quits the game' do
          expect(presenter).to have_received(:quit)
        end
      end
    end

    describe 'scoring the game' do
      let(:game) do
        allow_any_instance_of(ComputerPlayer)
          .to receive(:make_throw) { Throw.new('rock') }

        Game.new(presenter: presenter)
      end

      context 'computer throws "rock"' do
        context 'human wins: throws "paper"' do
          before do
            allow(STDIN).to receive(:gets).and_return("1\n", "paper\n")
          end

          it 'tells the human they won' do
            game.play
            expect(presenter).to have_received(:win).with(:human)
          end
        end

        context 'human loses: throws "scissors"' do
          before do
            allow(STDIN).to receive(:gets).and_return("1\n", "scissors\n")
          end

          it 'tells the human the computer won' do
            game.play
            expect(presenter).to have_received(:win).with(:computer)
          end
        end

        context 'human ties: throws "rock"' do
          before do
            allow(STDIN).to receive(:gets).and_return("1\n", "rock\n")
          end

          it 'tells the human about the tie' do
            game.play
            expect(presenter).to have_received(:tie)
          end
        end
      end
    end
  end
end
