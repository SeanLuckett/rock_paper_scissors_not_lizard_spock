module RockPaperScissorsNotLizardSpock
  class Throw
    LEGAL_THROWS = %w(rock paper scissors).freeze
    THROW_RULES = {
      rock:     { beats: 'scissors', ties: 'rock' },
      paper:    { beats: 'rock', ties: 'paper' },
      scissors: { beats: 'paper', ties: 'scissors' }
    }.freeze

    attr_reader :choice

    def self.random_throw
      LEGAL_THROWS.sample
    end

    def initialize(player_throw)
      @choice = player_throw
    end

    def beats?(other_throw)
      return false if tied?(other_throw)
      THROW_RULES.dig(@choice.to_sym, :beats) == other_throw.choice
    end

    def legal?
      LEGAL_THROWS.include? @choice
    end

    def tied?(other_throw)
      THROW_RULES.dig(@choice.to_sym, :ties) == other_throw.choice
    end
  end
end