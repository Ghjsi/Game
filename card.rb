class Card
  attr_reader :deck

  def initialize
    @deck = []
    deck
  end

  def give_card
    taken_card = @deck[rand(@deck.size)]
    @deck.delete(taken_card)
  end

  private
  
  def deck
    names = %w(K Q J A 2 3 4 5 6 7 8 9 10)
    suits = ["\u2665", "\u2666", "\u2663", "\u2660"]
    names.each do |name|
      @deck << "#{name} #{suits[0]}"
      @deck << "#{name} #{suits[1]}"
      @deck << "#{name} #{suits[2]}"
      @deck << "#{name} #{suits[3]}"
    end
  end
end