require "colorize"

#Class that ask and stock name of user and his status (winner/loser)
class Player

attr_accessor :status
attr_accessor :name


 def initialize(number)
   @number = number
   @name = "a"
   @status = ""
 end

#Ask for the name of the player
def set_name
   puts "Quel est le nom du joueur numero #{@number}"
   @name = gets.chomp()
 end

end

#Class that order to BoardCase to fill the blank with "o" and "x" and look for potential alignement
class Board
  attr_accessor :cases

def initialize
    @cases = []
    for i in 1..9
      @cases.push(BoardCase.new(i))
    end
end

#Look for potential alignement
def set_winner
    @tab = @cases.map { |e| e.fill }
    if  @tab[0] == @tab[3] && @tab[3] == @tab[6] && @tab[0] !=""
      return @cases.map { |e| e.get_player }[0]
    end
    if  @tab[1] == @tab[4] && @tab[4] == @tab[7]  && @tab[1] !=""
      return @cases.map { |e| e.get_player }[1]
    end
    if  @tab[2] == @tab[5] && @tab[5] == @tab[8] && @tab[2] !=""
      return @cases.map { |e| e.get_player }[2]
    end
    if  @tab[0] == @tab[1] && @tab[1] == @tab[2] && @tab[0] !=""
      return @cases.map { |e| e.get_player }[0]
    end
    if  @tab[3] == @tab[4] && @tab[4] == @tab[5] && @tab[3] !=""
      return @cases.map { |e| e.get_player }[3]
    end
    if  @tab[6] == @tab[7] && @tab[7] == @tab[8] && @tab[6] !=""
      return @cases.map { |e| e.get_player }[6]
    end
    if  @tab[0] == @tab[4] && @tab[4] == @tab[8] && @tab[0] !=""
      return @cases.map { |e| e.get_player }[0]
    end
    if  @tab[2] == @tab[4] && @tab[4] == @tab[6] && @tab[2] !=""
      return @cases.map { |e| e.get_player }[2]
    end
end

#Define how to fill the blank
def set_play(player, coordinate)
  if player == 1
    @cases[coordinate-1].fill = "x"
  end
  if player == 2
    @cases[coordinate-1].fill = "o"
  end
end

end

#CLass that return the status (variable "fill") of a case
class BoardCase

attr_accessor :fill

def initialize(coordinate)
  @fill = ""
  @coordinate = coordinate
end

def get_player
  if @fill == "x"
    return 1
  end
  if @fill == "o"
    return 2
  end
end

end

#CLass that launch the game and the behaviour of a party
class Game

def initialize
  @answer = ""
  @turn = 0
  @new_game = "Y"
  initialize_players
  while @new_game == "Y"
    initialize_board
    launch_action
    ask_retry
  end
end

#Setting the 2 players
def initialize_players
  @joueur1 = Player.new(1)
  @joueur2 = Player.new(2)
  @joueur1.set_name
  @joueur2.set_name
end

#Setting the board
def initialize_board
  @plateau = Board.new()
end

#Setting the global behaviour
def launch_action
while @plateau.set_winner == nil && @turn <=8
  display_board(@plateau.cases.map { |e| e.fill })
  if (@turn % 2) + 1 == 1
    puts "#{@joueur1.name.red}, ou voulez vous jouez ?"
  else
    puts "#{@joueur2.name.green}, ou voulez vous jouez ?"
  end
  @answer = gets.chomp().to_i
  @plateau.set_play((@turn % 2) + 1, @answer)
  @turn = @turn + 1
end
announce_winner
end

def ask_retry
  puts "Voulez-vous reccomencer ? (Y/N)"
  @new_game = gets.chomp()
end

#Visual motor
def display_board(board)

  board2 = []
  for i in 0..8
  if board[i] == ""
   board2.insert(i, i+1)
  end
  if board[i] == "x"
   board2.insert(i, "x".red)
  end
  if board[i] == "o"
   board2.insert(i, "o".green)
  end

  end

  puts " #{board2[0]} |"+" #{board2[1]} | #{board2[2]} "
  puts "-----------"
  puts " #{board2[3]} |"+" #{board2[4]} | #{board2[5]} "
  puts "-----------"
  puts " #{board2[6]} |"+" #{board2[7]} | #{board2[8]} "
end
#final announce and setting of the winning status of player class
def announce_winner
  if @plateau.set_winner == 1
    @joueur1.status = "gagnant"
    @joueur2.status = "perdant"
    puts "#{@joueur1.name} est gagnant et #{@joueur2.name} est perdant"
elsif @plateau.set_winner == 2
   @joueur1.status = "perdant"
   @joueur2.status = "gagnant"
   puts "#{@joueur1.name} est perdant et #{@joueur2.name} est gagnant"
elsif @turn == 9
  puts "Les deux joueurs sont à égalité"
  @turn = 0
end

end

end

#MAIN
jeu = Game.new
