class GroupsController < ApplicationController
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(create_params)
		if @group.save
			redirect_to :root
		else
		end
	end
	def create_params
		params.require(:group).permit(:name, user_ids: [])
	end
end
