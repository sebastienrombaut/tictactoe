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