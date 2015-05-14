class Ec2::Instance

	attr_reader :raw

	def initialize( instance )
		@raw = instance
	end

	def id
		@raw[:instance_id]
	end

	def name
		tag_value("Name")
	end

	def tag_value( key )
		key = key.to_s
		val = @raw[:tags].select { |n|  n.key == key }[0].value
		if val
			val = val.gsub /^"/, ''
			val = val.gsub /"$/, ''
			val.strip
		end
	end

	def start
		
	end

end