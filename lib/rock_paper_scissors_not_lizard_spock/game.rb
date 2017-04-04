module RockPaperScissorsNotLizardSpock
  class Game
    attr_reader :human_score

    def initialize(presenter:)
      @presenter = presenter
      @human_score = @computer_score = 0
      @human_player = HumanPlayer.new
      @computer_player = ComputerPlayer.new
    end

    def play
      presenter.welcome
      presenter.rules
      presenter.play_options

      play_choice = STDIN.gets.chomp

      if play_choice.to_i == 1
        begin
          presenter.player_prompt
          @human_player.make_throw
        end until @human_player.throw.legal?

        score(@human_player.throw, @computer_player.throw)
      else
        presenter.quit
      end
    end

    private
    attr_reader :presenter

    def score(human, computer)
      @human_score += 1
    end

  end
end