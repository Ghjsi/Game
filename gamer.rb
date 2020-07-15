class Gamer
  attr_accessor :bank, :hand_cards

  def initialize
    @bank = 100
    @hand_cards = []
    @points = 0
  end

  def get_card(deck_name)
    @hand_cards << deck_name.give_card
  end

  def points
    @points = 0
    @hand_cards.each do |card|
      card_name = card.name
      case card_name
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
        @points += card_name.to_i
      end
    end
    @points
  end
end
