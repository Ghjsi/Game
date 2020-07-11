class Diler < Gamer

  def move
    skip_move if self.points >= 17
    get_card($blackjack.card) if self.points < 17
  end

  def skip_move
    $blackjack.game
  end
end