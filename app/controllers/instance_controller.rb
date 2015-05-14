class InstanceController < ApplicationController

	def start
		Ec2::Service.new.start_instance(params[:instance_id])
		render status: 200, text: "OK"
	end

end