class Interface
  def start
    puts 'Enter your name:'
    @user_name = gets.chomp.capitalize
    puts "Hi, #{@user_name}"

    @card = Card.new
    @user = User.new
    @diler = Diler.new
    distribute
    game
  end


  def game
    loop do
      show_hand_cards
      puts "#{@user_name}, введите"
      puts '1 - чтобы пропустить ход'
      puts '2 - добавить карту'
      puts '3 - открыть карты'
      choice = gets.chomp

      case choice
      when '1'
        gamer_skip_move
      when '2'
        add_card
      when '3'
        open_cards
      end
    end
  end

  def distribute
    2.times { @user.get_card(@card) }
    2.times { @diler.get_card(@card) }
  end

  def show_hand_cards
    print 'Карты у вас в руке:'
    @user.hand_cards.each { |card| print "|#{card}|  "}
    print 'Карты в руке соперника:'
    @diler.hand_cards.each { |card| print "|?card?|  "}
 end

  def gamer_skip_move

  end
 #def podschet itoga
end