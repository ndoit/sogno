class Ec2::Service

	def initialize
		@@ec2 = ec2
	end

	def ec2
		creds = AwsCredentials.credentials
		Aws::EC2::Client.new( credentials: creds )
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


	def start_instance( instance_id ) 
		@@ec2.start_instances( instance_ids: [instance_id], additional_info: "", dry_run: false )
	end


end
