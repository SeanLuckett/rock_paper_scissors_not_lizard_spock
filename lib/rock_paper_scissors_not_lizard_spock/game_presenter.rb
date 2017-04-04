module RockPaperScissorsNotLizardSpock
  class GamePresenter
    def welcome
      puts <<~EOS
              Welcome to Rock Paper Scissors Not Lizard Spock,
              a typical, old-school game.
            EOS
    end

    def rules
      puts <<~EOS
              Simple:
                - rock beats scissors
                - scissors beat paper
                - paper beats rock
      
              You and the computer throw your choice and we see
              who's standing.
            EOS
    end

    def play_options
      puts 'Options:'
      puts '1) throw down'
      puts '2) quit'
      print '?>'
    end

    def player_prompt
      puts 'Go ahead and type in a throw choice (rock, paper, or scissors)'
    end

    def quit
      puts 'Well, be seeing ya.'
    end
  end
end