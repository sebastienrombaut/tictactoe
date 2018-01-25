# On commence par appeler le fichier qui contient les classes nécessaires au fonctionnement du jeu

require_relative "board_boardcase_player"

# La classe Game orchestre le jeu :

class Game

	# A l'initialisation, Game instancie deux players et un board

	def initialize 
		@player1 = Player.new
		@player2 = Player.new
		@my_board = Board.new
		puts "Tu connais la bataille navale ? On joue avec la même map !"
		@my_board.display
	end

	# La méthode end_game fait appel à deux méthodes définies dans Board : si l'un des deux joueurs complète une combinaison gagnante, end_game affiche un message qui indique quel joueur a gagné

	def end_game 
		
		if @my_board.check_combinations_player1 == true
			puts "Fin du game, #{@player1.name} a gagné"
		elsif @my_board.check_combinations_player2 == true
			puts "Fin du game, #{@player2.name} a gagné"
		end
	end

	# Les méthodes verif_player vérifient le format des coordonnées entrées par l'utilisateur, et lui demande de rejouer si elles sont erronées

	def verif_player1
        if @player_choice == "A1" || @player_choice == "A2" || @player_choice == "A3" || @player_choice == "B1" || @player_choice == "B2" || @player_choice == "B3" || @player_choice == "C1" || @player_choice == "C2" || @player_choice == "C3"  
             puts "Go #{@player_choice}!"
        else puts "Meeh ! Voici le format à respecter : A1, b3 ..."
             player1_plays
        end
    end

    def verif_player2
        if @player_choice == "A1" || @player_choice == "A2" || @player_choice == "A3" || @player_choice == "B1" || @player_choice == "B2" || @player_choice == "B3" || @player_choice == "C1" || @player_choice == "C2" || @player_choice == "C3"  
             puts "Go #{@player_choice}!"
        else puts "Meeh ! Voici le format à respecter : A1, b3 ..."
             player2_plays
        end
    end

    # Les méthodes verif_empty_case_player s'assurent que la case choisie par l'utilisateur est bien vide et lui demandent de rejouer dans le cas contraire

    def verif_empty_case_player1
    	if (@player_choice == "A1" && @my_board.my_array[0][0] != " ") || (@player_choice == "A2" && @my_board.my_array[0][1] != " ") || (@player_choice == "A3" && @my_board.my_array[0][2] != " ") || (@player_choice == "B1" && @my_board.my_array[1][0] != " ") || (@player_choice == "B2" && @my_board.my_array[1][1] != " ") || ((@player_choice == "B3" && @my_board.my_array[1][2] != " ")) || (@player_choice == "C1" && @my_board.my_array[2][0] != " ") || (@player_choice == "C2" && @my_board.my_array[2][1] != " ") || (@player_choice == "C3" && @my_board.my_array[2][2] != " ")
    		puts "Meeh ! La case déjà remplie !"
    		player1_plays
    	end
    end

     def verif_empty_case_player2
    	if (@player_choice == "A1" && @my_board.my_array[0][0] != " ") || (@player_choice == "A2" && @my_board.my_array[0][1] != " ") || (@player_choice == "A3" && @my_board.my_array[0][2] != " ") || (@player_choice == "B1" && @my_board.my_array[1][0] != " ") || (@player_choice == "B2" && @my_board.my_array[1][1] != " ") || ((@player_choice == "B3" && @my_board.my_array[1][2] != " ")) || (@player_choice == "C1" && @my_board.my_array[2][0] != " ") || (@player_choice == "C2" && @my_board.my_array[2][1] != " ") || (@player_choice == "C3" && @my_board.my_array[2][2] != " ")
    		puts "Meeh ! La case déjà remplie !"
    		player2_plays
    	end
    end

	# Les deux méthodes suivantes correspondent à chaque tour de jeu, pour chaque joueur
	# Chaque méthode : 
		# - Invite le joueur à choisir sur quel case il souhaite jouer, 
		# - Stocke le choix dans une variables
		# - Fait appel aux deux méthodes de vérification
		# - Fait appel à la méthode de Board destinée à modifier le plateau
		# - Affiche le plateau dans la console
		# - Fait appel à la méthode end_game pour afficher un message en cas de victoire

	def player1_plays
		puts "#{@player1.name}, où aimerais-tu jouer ? (ex. A1, B2, ...)"
		@player_choice = gets.chomp.capitalize
		verif_player1
		verif_empty_case_player1
		@my_board.player1_modifies_a_case(@player_choice)
		@my_board.display
		puts self.end_game
	end

	def player2_plays
		puts "#{@player2.name}, où aimerais-tu jouer ? (ex. A1, B2, ...)"
		@player_choice = gets.chomp.capitalize
		verif_player2
		verif_empty_case_player2
		@my_board.player2_modifies_a_case(@player_choice)
		@my_board.display
		puts self.end_game
	end

	# La méthode suivante fait se succéder les tours, mais stoppe l'exécution du programme en cas de victoire de l'un ou l'autre des joueurs

	def processing_game
		5.times do
			self.player1_plays
			break if @my_board.check_combinations_player1 == true
			if @my_board.my_array[0][0] != " " && @my_board.my_array[0][1] != " " && @my_board.my_array[0][2] != " " && @my_board.my_array[1][0] != " " && @my_board.my_array[1][1] != " " && @my_board.my_array[1][2] != " " && @my_board.my_array[2][0] != " " && @my_board.my_array[2][1] != " " && @my_board.my_array[2][2] != " "
				puts "Match nul !"
				break
			end
			self.player2_plays
			break if @my_board.check_combinations_player2 == true
		end

	end
end

puts "C'est parti !"
puts "_____________"
puts " "

my_game = Game.new.processing_game