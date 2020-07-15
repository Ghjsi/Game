class Play
  attr_reader :diler, :user, :the_deck, :stake

  def initialize(user, diler)
    @user = user
    @diler = diler

    @user_points = 0
    @diler_points = 0

    @players = [@user, @diler]
  end

  def start
    @stake = 0
    @user.hand_cards.clear
    @diler.hand_cards.clear
    @the_deck = Deck.new
    distribute
    @players.each { |player| make_bet(player) }
  end

  def make_bet(player)
    if player.bank > 0
      player.bank -= 10
      @stake += 10
    else
      puts 'Bank is empty'
    end
  end

  def diler_move
    @diler.get_card(@the_deck) if @diler.points < 17
  end

  def user_move
    @user.get_card(@the_deck)
  end

  def distribute
    2.times { @user.get_card(@the_deck) }
    2.times { @diler.get_card(@the_deck) }
  end

  def full_hands?
    if @user.hand_cards.size >= 3 && @diler.hand_cards.size >= 3
      true
    else
      false
    end
  end

  def win
    @user.bank += @stake
    @stake = 0
    puts "В банке соперника #{@diler.bank} долларов."
    puts "В вашем банке #{@user.bank} долларов."
  end

  def loose
    @diler.bank += @stake
    @stake = 0
    puts "В банке соперника #{@diler.bank} долларов."
    puts "В вашем банке #{@user.bank} долларов."
  end

  def return_bets
    @user.bank += 10
    @diler.bank += 10
    @stake = 0
  end
end
