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

    def points
  #   point = 10 if name == 'K' || 'Q' || 'J'
  #   point = 10 if 
  #   point = 000 if name.to_i
    end

  private
    def deck
    #@names = ['King', 'Queen', 'Jack', 'Ace', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
    names = %w(K Q J A 2 3 4 5 6 7 8 9 10)
    suits = ["\u2665", "\u2666", "\u2663", "\u2660"]
    #suits = %w(\u2665 \u2666 \u2663 \u2660)
    names.each do |name| # map mozet
      @deck << "#{name}#{suits[0]}"
      @deck << "#{name}#{suits[1]}"
      @deck << "#{name}#{suits[2]}"
      @deck << "#{name}#{suits[3]}"
    end
  end
end