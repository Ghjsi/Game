class Diler < Gamer

  def diler_go
    skip_move if points >= 17
    get_card(@card) if points < 17
  end

  # def skip_move
  #   user_go
  # end
end