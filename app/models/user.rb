class User
	attr_accessor :name, :email, :number, :paid

	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
		@number = 0 #Need to update to generate value for each user.
	end

	def formatted_email
		"#{@name} <#{@email}>}"
	end

	def formatted_all
		"#{@name} #{@number} <#{@email}>"
	end
end