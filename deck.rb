class Deck
  attr_reader :deck

  NAMES = %w[K Q J A 2 3 4 5 6 7 8 9 10].freeze
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze

  def initialize
    @deck = []
    deck_create
  end

  def deck_create
    NAMES.each do |name|
      @deck << Card.new(name, SUITS[0])
      @deck << Card.new(name, SUITS[1])
      @deck << Card.new(name, SUITS[2])
      @deck << Card.new(name, SUITS[3])
    end
  end

  def give_card
    taken_card = @deck[rand(@deck.size)]
    @deck.delete(taken_card)
  end
end
