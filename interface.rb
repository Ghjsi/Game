class Interface
  def initialize(user, diler, play)
    @play = play
    @user = user
    @diler = diler

    greetings
  end

  def greetings
    puts 'Введите Ваше имя:'
    @user_name = gets.chomp.capitalize
    puts "Привет, #{@user_name}!"
    start
  end

  def start
    @play.start

    puts "Игроки сделали ставки по 10 долларов. В вашем банке #{@user.bank} долларов."
    puts "На кону #{@play.stake}"

    game
  end

  def game
    loop do
      open_cards if @play.full_hands?

      print 'Сумма Ваших очков:'
      puts @user.points
      show_hand_cards
      puts "\n #{@user_name} - Ваш ход. Введите:"
      puts '1 - чтобы пропустить ход'
      puts '2 - добавить карту'
      puts '3 - открыть карты'
      puts '4 - выйти из игры'
      choice = gets.chomp

      case choice
      when '1'
        @play.diler_move
      when '2'
        @play.user_move
      when '3'
        open_cards
      when '4'
        break
      else
        puts 'Неверный ввод.'
      end
    end
  end

  def show_hand_cards
    print 'Карты у вас в руке:'
    @user.hand_cards.each { |card| print "|#{card.name} #{card.suit}|  " }
    puts ' '
    print 'Карты в руке соперника:'
    @diler.hand_cards.each { |_card| print '|**|  ' }
  end

  def open_cards
    puts 'Ваши карты:'
    @user.hand_cards.each { |card| print "|#{card.name} #{card.suit}|  " }
    puts ' '
    puts 'Карты соперника:'
    @diler.hand_cards.each { |card| print "|#{card.name} #{card.suit}|  " }
    puts ' '
    total_calculating
  end

  def total_calculating
    puts "Вы набрали #{@user.points} очков"
    puts "Соперник набрал #{@diler.points} очков"

    if @user.points > @diler.points && @user.points <= 21
      puts 'Вы выиграли!'
      @play.win

    elsif @user.points < @diler.points && @user.points <= 21
      puts 'Вы проиграли.'
      @play.loose

    elsif @diler.points > 21 && @user.points <= 21
      puts 'Вы выиграли!'
      @play.win

    elsif @user.points > 21 && @diler.points < 21
      puts 'Вы проиграли.'
      @play.loose

    else
      puts 'Ничья'
      @play.return_bets
    end
    puts '------new_round--------'

    continue
  end

  def continue
    puts 'Хотите продолжить игру? 1 - да, 2 - нет.'
    choice = gets.chomp
    case choice
    when '1'
      start
    when '2'
      exit
    end
  end
end
