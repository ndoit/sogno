class InstanceListController < ApplicationController

	def table
		@instance_list = ec2_service.instances( params[:state] )
	end

	def ec2_service
		@ec2 ||= Ec2::Service.new
	end
end
