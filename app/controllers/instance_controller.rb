class InstanceController < ApplicationController

	def start
		instance_id = params[:instance_id]
		Ec2::Service.new.start_instance(instance_id)
		ActivityLog.create( user: current_user, action: "start", detail: "", resource_id: instance_id )
		render status: 200, json: {}
	end

end