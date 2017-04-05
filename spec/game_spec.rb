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

      it 'presents the ui menu until player chooses not to play' do
        game.play
        expect(presenter).to have_received(:play_options).twice
      end

      context 'player plays' do
        it 'prompts player to make a throw' do
          game.play
          expect(presenter).to have_received(:player_prompt)
        end
      end

      context 'player quits' do
        it 'quits the game' do
          game.play
          expect(presenter).to have_received(:quit)
        end
      end

    end

    describe 'scoring the game' do
      context 'computer throws "rock"' do
        let(:game) do
          allow_any_instance_of(ComputerPlayer)
            .to receive(:make_throw) { Throw.new('rock') }

          Game.new(presenter: presenter)
        end

        context 'human wins: throws "paper"' do
          before do
            allow(STDIN).to receive(:gets).and_return("1\n", "paper\n")
          end

          it 'tells the human they won' do
            game.play
            expect(presenter).to have_received(:win).with(:human)
          end

          it 'gives the human a point' do
            expect { game.play }.to change { game.human_score }.by 1
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

          it 'gives the computer a point' do
            expect { game.play }.to change { game.computer_score }.by 1
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

          it 'gives neither player a point' do
            expect { game.play }.to_not change { game.human_score }
            expect { game.play }.to_not change { game.computer_score }
          end
        end
      end
    end
  end
end
