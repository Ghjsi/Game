require_relative 'play'
require_relative 'gamer'
require_relative 'user'
require_relative 'diler'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

class BlackJack
  def initialize
    user = User.new
    diler = Diler.new
    play = Play.new(user, diler)
    Interface.new(user, diler, play) # (play)
  end
end

BlackJack.new
