module RockPaperScissorsNotLizardSpock
  class Game

    def initialize(presenter: GamePresenter.new)
      @presenter = presenter
      @human_score = @computer_score = 0
      @human_player = HumanPlayer.new
      @computer_player = ComputerPlayer.new
    end

    def play
      introduction
      throw_down
      presenter.quit
    end

    private

    attr_reader :presenter, :human_player, :computer_player

    def introduction
      presenter.welcome
      presenter.rules
    end

    def keep_playing?
      presenter.play_options
      play_choice = STDIN.gets.chomp.to_i
      play_choice == 1
    end

    def score(human_throw, computer_throw)
      presenter.computer_play(computer_throw)

      if human_throw.tied?(computer_throw)
        presenter.tie
        return
      end

      if human_throw.beats?(computer_throw)
        @human_score += 1
        presenter.win(:human)
      else
        @computer_score += 1
        presenter.win(:computer)
      end
    end

    def throw_down
      while keep_playing?
        presenter.score(@computer_score, @human_score)

        begin
          presenter.player_prompt
          human_player.make_throw
        end until human_player.throw.legal?

        score(human_player.throw, computer_player.throw)
      end
    end
  end
end