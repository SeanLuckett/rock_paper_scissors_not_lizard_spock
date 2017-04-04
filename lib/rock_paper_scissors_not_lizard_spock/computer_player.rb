module RockPaperScissorsNotLizardSpock
  class ComputerPlayer
    attr_reader :throw

    def initialize
      @throw = make_throw
    end

    def make_throw
      @throw = Throw.new(Throw.random_throw)
    end
  end
end
