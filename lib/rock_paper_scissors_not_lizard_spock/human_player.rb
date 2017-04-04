module RockPaperScissorsNotLizardSpock
  class HumanPlayer
    attr_reader :throw

    def make_throw(player_throw)
      @throw = Throw.new(player_throw.downcase)
    end
  end
end