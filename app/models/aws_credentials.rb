class AwsCredentials

	def self.credentials
		if ENV.has_key?( 'AWS_SECURITY_TOKEN' )    # localhost
			puts "localhost"
			# get values from env.  requires me to have set them in advance
			# this shell script will do it for you:
			# https://drive.google.com/open?id=0B9zvaVUfUa8mRXE2TjdRTzc4UWM
			creds = Aws::Credentials.new( ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'], ENV['AWS_SECURITY_TOKEN'] )
		else
			puts "assume role"
			sts = Aws::STS::Client.new
			session = sts.assume_role( role_arn: ENV['ROLE_ARN'], role_session_name: ENV['ROLE_SESSION_NAME'] )
			creds = Aws::Credentials.new( session.credentials.access_key_id, session.credentials.secret_access_key, session.credentials.session_token )
		end		
	end

end