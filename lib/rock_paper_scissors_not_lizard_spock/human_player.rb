module RockPaperScissorsNotLizardSpock
  class HumanPlayer
    attr_reader :throw

    def make_throw
      player_throw = STDIN.gets.chomp
      @throw = Throw.new(player_throw.downcase)
    end
  end
end