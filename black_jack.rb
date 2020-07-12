require_relative 'gamer'
require_relative 'user'
require_relative 'diler'
require_relative 'card'
require_relative 'interface'

# rubocop:disable Style/GlobalVars
$blackjack = Interface.new

$blackjack.greetings
# rubocop:enable Style/GlobalVars
