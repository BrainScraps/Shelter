require "pry"

require_relative "shelter"
require_relative "pet"
require_relative "client"

		def process_adoption(pet, name, shelter)
				
				if shelter.pets[pet].is_available? 
				shelter.pets[pet].owner = name
				shelter.clients[name].pets[pet] = shelter.pets[pet]
				puts "Hooray! #{name} is now the owner of #{pet}."
				else
				puts "I'm sorry, #{pet} has already been adopted."

				end



		end


		def show_client_list(shelter)
				shelter.clients.each { |k, v| v.to_s 
					puts ""}


		end	


		def show_pets_list(shelter)
			shelter.pets.each {|k, v| v.to_s 
				puts ""}


		end	

def starting_page

	unless defined? shelter


			shelter = Shelter.new

			p1 = Pet.new("Bob", "cat", "female", true)
			p2 = Pet.new("Jimmy", "ferret", "female", true)
			p3 = Pet.new("Kindsey", "cat", "male", false)
			p4 = Pet.new("Reginald", "dog", "male", true)

			#filling shelter pets hash
			shelter.pets[p1.name] = p1 

			shelter.pets[p2.name] = p2 

			shelter.pets[p3.name] = p3

			shelter.pets[p4.name] = p4 


			c1 = Client.new("Larry", "5103574089", "1122 Boogie Woogie Avenue")
			c2 = Client.new("Roy", "5203574089", "1125 Boogie Woogie Avenue")
			c3 = Client.new("John", "5403574089", "1126 Boogie Woogie Avenue")
			c4 = Client.new("Lisa", "5503574089", "1127 Boogie Woogie Avenue")

			#filling shelter client hash

			shelter.clients[c1.name] = c1 

			shelter.clients[c2.name] = c2 

			shelter.clients[c3.name] = c3

			shelter.clients[c4.name] = c4 


	end

	puts "---Welcome to the Shelter--- "
	puts "Are you a (c)lient) or (a)dmin?"
	puts "Type 'q' to quit."
	response = gets.chomp

		if response == "c"
				puts "What is your name?"
				name = gets.chomp.capitalize
				puts "(a)dopt or (d)rop off"
				choice = gets.chomp.downcase
					if choice == "a"

							show_pets_list(shelter)

							puts "Please put the name of the pet you desire."
							petname = gets.chomp
						
							process_adoption(petname, name, shelter)

							puts "Congratulations. #{petname.capitalize} is yours. "
							starting_page

					else choice == "d"
						
						puts "What is the pet's name?"
						pname = gets.chomp.capitalize

						puts "What type of animal is #{pname}?"
						ptype  = gets.chomp

						puts "What is the sex of #{pname}?"
						psex = gets.chomp

						puts "Is #{pname} fixed? (y or n)"
						input =gets.chomp.downcase 

						if input == 'y'
								pfixed = true
							else
								pfixed = false
						end

						newpet = Pet.new(pname, ptype, psex, pfixed)

						shelter.pets[newpet.name] = newpet

						puts "We will do our best to find a great home for #{pname}. Take care, doofus."
						starting_page

					end	


		
		elsif response =="a"

			print "Welcome, admin. Please enter the password: "
			password = gets.chomp

			if password == "welovepets"

			  puts "Successfully authenticated! "
			  puts ""
			  puts "What function would you like to use today?"
			  puts "(C)lients, (P)ets, (B)doption"

			  option = gets.chomp.downcase

			  if option == "c" 
			  	show_client_list(shelter)

						puts "E(n)ter a new client "									


				elsif option =="p"

						show_pets_list(shelter)
				
						puts "(add) a new pet"
						addresponse = gets.chomp
								if 
						 		addresponse == "add" 			

								puts "What is the pet's name?"
								pname = gets.chomp.capitalize

								puts "What type of animal is #{pname}?"
								ptype  = gets.chomp

								puts "What is the sex of #{pname}?"
								psex = gets.chomp

								puts "Is #{pname} fixed? (y or n)"
								input = gets.chomp.downcase 

								if input == 'y'
										pfixed = true
									else
										pfixed = false
								end
							end

						newpet = Pet.new(pname, ptype, psex, pfixed)
						
						shelter.pets[newpet.name] = newpet

						starting_page
						elsif option == "b"
							show_client_list(shelter)
							puts "Client name?"
							cname = gets.chomp.capitalize
							show_pets_list(shelter)
							puts "Pet name?"
							pname = gets.chomp.capitalize

								process_adoption(pname, cname, shelter)
								starting_page
								


							else
								puts "no"
								starting_page
						end


			  

			else
				puts "Sorry, that password is incorrect, please relaunch the program."
					starting_page


			end

	



end

end




starting_page



binding.pry