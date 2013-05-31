class Pet

attr_accessor :name, :type, :sex, :fixed, :toys, :owner



	def initialize(name, type, sex, fixed)
		@name = name
		@type = type
		@sex = sex
		@fixed = fixed
		@owner = nil


	end	


	def to_s 

	puts "Name: #{@name}"	
	puts "Type: #{@type}"
	puts "Sex: #{@sex}"
	puts "Fixed: #{fixed}"


	end

	def is_available?

		if @owner == nil
			true
		else 
			false
		end
	end



end	
