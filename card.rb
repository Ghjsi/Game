CARD_NAMES = %w[K Q J A 2 3 4 5 6 7 8 9 10].freeze
CARD_SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze

class Card
  attr_reader :name, :suit

  def initialize(name, suit)
    @card = "#{name} #{suit}"
    @name = name
    @suit = suit
  end
end
