class Gamer

  @@stake = 0 # на кону 0 долл

  attr_accessor :hand_cards

  attr_reader :points, :bank

  def initialize
    @bank = 100
    @hand_cards = []
    @points = 0
  end

  def make_bet
    if @bank > 0
      @bank -= 10
      @@stake +=10
    else
      puts 'Bank is empty'
    end
  end

  def skip_move
  end

  def get_card(deck_name)
    @hand_cards << deck_name.give_card
  end

  def points
    @points = 0
    @hand_cards.each do |card|
      symbols = card.split(" ")
      suit = symbols[0]

      case suit
      when 'K'
        @points += 10
      when 'Q'
        @points += 10
      when 'J'
        @points += 10
      when 'A'
        @points += 1 if @points + 11 >= 21
        @points += 11 if @points + 11 < 21
      else
        @points += suit.to_i
      end
    end
    @points
  end

end
