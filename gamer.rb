class Gamer

  attr_accessor :hand_cards

  def initialize #(name)
    #@name = name
    @bank = 100
    @hand_cards = []
  end

  def make_bet
    if @bank > 0
      @bank -= 10 
    else
      puts 'Bank is empty'
    end
  end

  def skip_move
  end

  def get_card(deck_name)
    @hand_cards << deck_name.give_card
  end
  
end
