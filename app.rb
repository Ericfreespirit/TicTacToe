class Game
  #Maitre du jeu
  def initialize
    @@answer = " "
    joueur1 = Player.new(1)
    joueur2 = Player.new(2)
    plateau = Board.new()
    joueur1.set_name
    joueur2.set_name
    plateau.create_board_cases

    while #@@answer joueur1 or joueur2 .alignement

    puts "#{joueur1.get_name} à votre tour"
    play
    puts "#{joueur2.get_name} à votre tour"
    play
    #END
    end


  end



  def winner_looser
    #va voir dans le board qui a gagner
    #va voir dans le player le nom du joueur a gagner
    #renvoie le nom du joueur
  end



  def play
  #rattacher une image du plateau avec coordonée
    puts "Où voulez vous jouez ?"
    @answer = gets.chomp()



    #Demande du placement de symboles
    #Remplir la case correspondante
  end

end





class Player
 def initialize(number)
   @number = number
   @name
 end



 def set_name
   puts "Quel est le nom du joueur #{@number}"
   @name = gets.chomp()
 end




 def get_name
   return @name
 end

 def get_number
   return @number
 end

end



class Board
  #vision macro
  def initialize

  end


  def create_board_cases
    @cases = []
    for i in 1..9
      @cases.push(BoardCase.new(i))
    end
  end

  def player_choice
    

  end


  def alignement
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
  #vision micro
  def initialize(coordone)
  @remplissage = nil
  @coordone = coordone
  end

  def set_remplissage
#Remplir une case (déja identifier sur la board)
#Transposer nil par X ou O
    if player.get_number = 1
   @remplissage = x
    else
  @remplissage = o
    end

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



jeu = Game.new
