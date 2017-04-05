module RockPaperScissorsNotLizardSpock
  class Game

    def initialize(presenter:)
      @presenter = presenter
      @human_score = @computer_score = 0
      @human_player = HumanPlayer.new
      @computer_player = ComputerPlayer.new
    end

    def play
      introduction
      throw_down
      score(human_player.throw, computer_player.throw)
      presenter.quit
    end

    private

    attr_reader :presenter, :human_player, :computer_player, :computer_score, :human_score

    def introduction
      presenter.welcome
      presenter.rules
    end

    def keep_playing?
      presenter.play_options
      play_choice = STDIN.gets.chomp.to_i
      play_choice == 1
    end

    def score(human, computer)
      presenter.tie if human.tied?(computer)

      if human.beats?(computer)
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
      end
    end
  end
end