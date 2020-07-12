class Diler < Gamer
  def move
    skip_move if points >= 17
    # rubocop:disable Style/GlobalVars
    get_card($blackjack.card) if points < 17
  end

  def skip_move
    $blackjack.game
    # rubocop:enable Style/GlobalVars
  end
end
