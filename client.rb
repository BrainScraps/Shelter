class Client

	attr_accessor :name, :phone, :address, :pets

	def initialize(name, phone, address)
		@name = name 
		@phone = phone
		@address = address
		@pets = {}

	end

	def to_s 
		puts " Name: #{@name} "
		puts " Phone: #{@phone} "
		puts " Address: #{@address} "
		if @pets.empty?
			puts " Pets: 0"
		else 
			puts " Pets: #{@pets} "
		end
	end
end