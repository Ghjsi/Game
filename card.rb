class Card
  attr_reader :name, :suit

  def initialize(name, suit)
    @card = "#{name} #{suit}"
    @name = name
    @suit = suit
  end
end
