class Ec2::Service

	def initialize
		@@ec2 = Aws::EC2::Client.new
	end

	def instances( state )
		state = state.to_s
		@instances = []
		i = @@ec2.describe_instances( filters: [ { name: "instance-state-name", values: [state] } ] )
		i[:reservations].each do |reservation|
			reservation[:instances].each do |instance|
				@instances << Ec2::Instance.new(instance)
			end
		end
		@instances

	end

end
