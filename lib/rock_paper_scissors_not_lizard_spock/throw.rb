module RockPaperScissorsNotLizardSpock
  class Throw
    LEGAL_THROWS = %w(rock paper scissors).freeze
    THROW_RULES = {
      rock:     { beats: 'scissors', ties: 'rock' },
      paper:    { beats: 'rock', ties: 'paper' },
      scissors: { beats: 'paper', ties: 'scissors' }
    }.freeze
    attr_reader :player_throw

    def self.random_throw
      LEGAL_THROWS.sample
    end

    def initialize(player_throw)
      @player_throw = player_throw
    end

    def beats?(other_throw)
      return false if tied?(other_throw)
      THROW_RULES[@player_throw.to_sym][:beats] == other_throw.player_throw
    end

    def legal?
      LEGAL_THROWS.include? @player_throw
    end

    def tied?(other_throw)
      THROW_RULES[@player_throw.to_sym][:ties] == other_throw.player_throw
    end
  end
end