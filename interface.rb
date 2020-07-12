class Interface

  attr_reader :diler, :user, :card

  def greetings
    puts 'Enter your name:'
    @user_name = gets.chomp.capitalize
    puts "Hi, #{@user_name}"

    @card = Card.new
    @user = User.new
    @diler = Diler.new
    distribute

    start
  end

  def start

    @user.make_bet
    @diler.make_bet
    puts "Игроки сделали ставки по 10 долларов. В вашем банке #{@user.bank} долларов."
    puts "На кону #{Gamer.class_eval("@@stake")}"
    game
  end


  def game
    loop do

      open_cards if full_hands?

      print 'Сумма Ваших очков:'
      puts "#{@user.points}"
      show_hand_cards
      puts "\n #{@user_name} - Ваш ход. Введите:"
      puts '1 - чтобы пропустить ход'
      puts '2 - добавить карту'
      puts '3 - открыть карты'
      puts '4 - выйти из игры'
      choice = gets.chomp

      case choice
      when '1'
        gamer_skip_move
      when '2'
        add_card
      when '3'
        open_cards
      when '4'
        break
      else
        puts 'Неверный ввод.'
      end
    end
  end

  def full_hands?
    if @user.hand_cards.size >= 3 && @diler.hand_cards.size >= 3
      true
    else
      false
    end
  end

  def distribute
    2.times { @user.get_card(@card) }
    2.times { @diler.get_card(@card) }
  end

  def show_hand_cards
    print 'Карты у вас в руке:'
    @user.hand_cards.each { |card| print "|#{card}|  "}
    puts ' '
    print 'Карты в руке соперника:'
    @diler.hand_cards.each { |card| print "|**|  "}
 end

  def gamer_skip_move
    @diler.move
  end

  def add_card
    @user.get_card(@card)
  end

  def open_cards
    puts 'Ваши карты:'
    @user.hand_cards.each { |card| print "|#{card}|  "}
    puts ' '
    puts 'Карты соперника:'
    @diler.hand_cards.each { |card| print "|#{card}|  "}
    puts ' '
    total_calculating
  end
  
  def total_calculating
    stake = Gamer.class_eval("@@stake")

    puts "Вы набрали #{@user.points} очков"
    puts "Соперник набрал #{@diler.points} очков"
    if @user.points > @diler.points && @user.points <= 21
      puts 'Вы выиграли!'
      win

    elsif @user.points < @diler.points && @diler.points <= 21
      puts 'Вы проиграли.'
      loose
    elsif @user.points > 21
      puts 'Вы проиграли.'
      loose
    elsif @diler.points > 21
      puts 'Вы выиграли!'
      win
    else
      puts 'Ничья'
      return_bets
    end
    puts '------new_round--------'
    # поделить кон
    start
  end

  def win
    prize = Gamer.class_variable_get("@@stake")
    Gamer.class_variable_set("@@stake", 0)

    @user.get_prize(prize)

    puts "В вашем банке #{@user.bank} долларов."
  end

  def loose
    prize = Gamer.class_variable_get("@@stake")
    Gamer.class_variable_set("@@stake", 0)

    @diler.get_prize(prize)

    puts "В банке соперника #{@diler.bank} долларов."
    puts "В вашем банке #{@user.bank} долларов."
  end

  def return_bets
    @user.bank +=10
    @diler.bank +=10
    Gamer.class_variable_set("@@stake", 0)
  end
end