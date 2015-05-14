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
		@raw[:tags].map { |n| n.value if n.key == key }[0]
	end

end