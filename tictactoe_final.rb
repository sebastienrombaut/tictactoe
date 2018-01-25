# On définit la classe "Board"

class Board
	attr_accessor :my_array

	# Pour chaque partie commencée, on initialise 9 instances de la classe "BoardCase" qui correspondent chacune à une case du jeu
	# "a" correspond à la première ligne, "b" à la deuxième, "c" à la troisième

	def initialize

		a1 = BoardCase.new("A1", " ")
		a2 = BoardCase.new("A2", " ")
		a3 = BoardCase.new("A3", " ")

		b1 = BoardCase.new("B1", " ")
		b2 = BoardCase.new("B2", " ")
		b3 = BoardCase.new("B3", " ")

		c1 = BoardCase.new("C1", " ")
		c2 = BoardCase.new("C2", " ")
		c3 = BoardCase.new("C3", " ")

	# On range l'état (appelé "value") de chaque case créée dans un array multi-dimensionnel : chaque dimension correspond à une ligne

	@my_array = [[a1.value, a2.value, a3.value], [b1.value, b2.value, b3.value], [c1.value, c2.value, c3.value]]

	end

	# On définit la méthode qui va "imprimer" le plateau sur la console, sous forme de trois arrays avec les indications des coordonnées de chaque case

	def display
		puts " "
		@my_array = @my_array.insert(0, "   1    2    3 ")
        letters = [" ", "A ","B ","C "]
        for i in (0..@my_array.size-1)
            puts letters[i] + @my_array[i].to_s
        end
        @my_array.delete_at(0)
		puts " "
	end

	# La méthode suivante fait passer l'état de la case choisie par le premier joueur : la case, sélectionnée par son placement dans le tableau multi-dimensionnel, passe de " " à "x"

	def player1_modifies_a_case(chosen_case)
		if chosen_case == "A1" 
			@my_array[0][0] = "x"
		elsif chosen_case == "A2" 
			@my_array[0][1] = "x"
		elsif chosen_case == "A3" 
			@my_array[0][2] = "x"
		elsif chosen_case == "B1" 
			@my_array[1][0] = "x"
		elsif chosen_case == "B2" 
			@my_array[1][1] = "x"
		elsif chosen_case == "B3" 
			@my_array[1][2] = "x"
		elsif chosen_case == "C1" 
			@my_array[2][0] = "x"
		elsif chosen_case == "C2" 
			@my_array[2][1] = "x"
		elsif chosen_case == "C3" 
			@my_array[2][2] = "x"
		end
	end

	# La méthode suivante fait passer l'état de la case choisie par le deuxième joueur : la case, sélectionnée par son placement dans le tableau multi-dimensionnel, passe de " " à "o"

	def player2_modifies_a_case(chosen_case)
		if chosen_case == "A1" 
			@my_array[0][0] = "o"
		elsif chosen_case == "A2" 
			@my_array[0][1] = "o"
		elsif chosen_case == "A3" 
			@my_array[0][2] = "o"
		elsif chosen_case == "B1" 
			@my_array[1][0] = "o"
		elsif chosen_case == "B2" 
			@my_array[1][1] = "o"
		elsif chosen_case == "B3" 
			@my_array[1][2] = "o"
		elsif chosen_case == "C1" 
			@my_array[2][0] = "o"
		elsif chosen_case == "C2" 
			@my_array[2][1] = "o"
		elsif chosen_case == "C3" 
			@my_array[2][2] = "o"
		end
	end

	# La méthode check les combinaisons gagnantes pour le premier joueur : si l'une d'entre elles est remplie, la méthode retourne la valeur true


	def check_combinations_player1

		if (@my_array[0][0] == "x" && @my_array[0][1] == "x" && @my_array[0][2] == "x") || (@my_array[1][0] == "x" && @my_array[1][1] == "x" && @my_array[1][2] == "x") || (@my_array[2][0] == "x" && @my_array[2][1] == "x" && @my_array[2][2] == "x") || (@my_array[0][0] == "x" && @my_array[1][0] == "x" && @my_array[2][0] == "x") || (@my_array[0][1] == "x" && @my_array[1][1] == "x" && @my_array[2][1] == "x") || (@my_array[0][2] == "x" && @my_array[1][2] == "x" && @my_array[2][2] == "x") || (@my_array[0][0] == "x" && @my_array[1][1] == "x" && @my_array[2][2] == "x") || (@my_array[0][2] == "x" && @my_array[1][1] == "x" && @my_array[2][0] == "x")
			return true
		else
			return false
		end
	end

	# La méthode check les combinaisons gagnantes pour le deuxième joueur : si l'une d'entre elles est remplie, la méthode retourne la valeur true

	def check_combinations_player2

		if (@my_array[0][0] == "o" && @my_array[0][1] == "o" && @my_array[0][2] == "o") || (@my_array[1][0] == "o" && @my_array[1][1] == "o" && @my_array[1][2] == "o") || (@my_array[2][0] == "o" && @my_array[2][1] == "o" && @my_array[2][2] == "o") || (@my_array[0][0] == "o" && @my_array[1][0] == "o" && @my_array[2][0] == "o") || (@my_array[0][1] == "o" && @my_array[1][1] == "o" && @my_array[2][1] == "o") || (@my_array[0][2] == "o" && @my_array[1][2] == "o" && @my_array[2][2] == "o" ) || (@my_array[0][0] == "o" && @my_array[1][1] == "o" && @my_array[2][2] == "o") || (@my_array[0][2] == "o" && @my_array[1][1] == "o" && @my_array[2][0] == "o")
			return true
		else
			return false
		end
	end
end

# La classe BoardCase contient les attributs de chaque case : un nom et un état ("value")

class BoardCase
	attr_accessor :case_name, :value

	def initialize(case_name, value)
		@case_name = case_name
		@value = value
	end
end

# La classe Player permet aux utilisateurs d'entrer un nom dans la console, et stocke ce nom dans une variable "name"

class Player
	attr_accessor :name, :n
	@@n = 1

	def initialize
		puts "Entrez le nom du joueur #{@@n} :"
		@name = gets.chomp.capitalize
		puts "Bienvenue #{@name} !"
		puts " "
		@@n += 1
	end
end

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
			puts "===== Nouveau round ! ======\n"
		end

		puts "Match nul !" if @my_board.check_combinations_player1 == false && @my_board.check_combinations_player2 == false
	end
end

puts "C'est parti !"
puts "_____________"
puts " "
my_game = Game.new

my_game.processing_game