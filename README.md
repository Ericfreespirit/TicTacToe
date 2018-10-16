Projet réalisé en pair programming par Eric et Marc
Son installation est directe aucune gemfgile n'est requise
Il s'agit d'un programme en POO qui permet de jouer au morpion.
Il se divise en 4 classes chacunes divisées en méthodes selon l'archiectrue suivante :

class Player
initialize
set_name

class Board
  initialize
  set_winner
  set_play
  
class BoardCase
initialize
get_player

class Game
initialize
initialize_players
initialize_board
launch_action
ask_retry
display_board
announce_winner
 
