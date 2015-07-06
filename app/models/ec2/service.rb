class Ec2::Service

	def initialize
		@@ec2 ||= ec2
	end

	def ec2

		sts = Aws::STS::Client.new
		if ENV.has_key?( 'AWS_MFA_TOKEN' )
			puts "get session token"
			session = sts.get_session_token( 
				duration_seconds: 3600, 
				serial_number: ENV['AWS_MFA_SERIAL'], 
				token_code: ENV['AWS_MFA_TOKEN'] )
		else
			puts "assume role"
			session = sts.assume_role( 
				role_arn: ENV['ROLE_ARN'], 
				role_session_name: 'foo' )
		end
		creds = Aws::Credentials.new( session.credentials.access_key_id, session.credentials.secret_access_key, session.credentials.session_token )
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
