class Player

attr_accessor :etat

 def initialize(number)
   @number = number
   @name = "a"
   @etat = ""
 end

def set_name
   puts "Quel est le nom du joueur numero #{@number}"
   @name = gets.chomp()
 end

def get_name
  return @name
end
end




class Board

def initialize
    @cases = []
    for i in 1..9
      @cases.push(BoardCase.new(i))
    end
end


def set_winner
    @tab = @cases.map { |e| e.get_remplissage  }
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

    if  @tab[2] == @tab[4] && @tab[4] == @tab[6]
      return @cases.map { |e| e.get_player }[2]
    end

end

end


class BoardCase

def initialize(coordone)
  @remplissage = "x"
  @coordone = coordone
end

def get_player
  if @remplissage == "x"
    return 1
  end
  if @remplissage == "o"
    return 2
  end
end

def get_remplissage
  return @remplissage
end

def get_coordone
  return @coordone
end

end

class Game

def initialize
  @answer = ""
  initialize_players_and_board
  launch_action
end

def initialize_players_and_board
  @joueur1 = Player.new(1)
  @joueur2 = Player.new(2)
  @plateau = Board.new()
  @joueur1.set_name
  @joueur2.set_name
end

def launch_action
display_board
set_play
announce_winner
end

def display_board
puts "Voici la planche"
end

def set_play
  puts "Ou voulez vous jouez ?"
  @answer = gets.chomp()
end

def announce_winner
  if @plateau.set_winner == 1
    puts @joueur1.etat = "Joueur 1 gagnant"
    puts @joueur2.etat = "Joueur 2 perdant"
  end
  if @plateau.set_winner == 2
    puts @joueur1.etat = "Joueur 2 gagnant"
    puts @joueur2.etat = "Joueur 1 perdant"
  end
end

def get_play
  return @answer
end

end
jeu = Game.new
