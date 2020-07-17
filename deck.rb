class Deck
  attr_reader :deck

  def initialize
    @deck = []
    deck_create
  end

  def deck_create
    Card::CARD_NAMES.each do |name|
      Card::CARD_SUITS.each do |suit|
        @deck << Card.new(name, suit)
      end
    end
  end

  def give_card
    taken_card = @deck[rand(@deck.size)]
    @deck.delete(taken_card)
  end
end
