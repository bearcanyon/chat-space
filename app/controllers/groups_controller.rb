class GroupsController < ApplicationController
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(create_params)
		@group.save
	end
	def create_params
		params.require(:group).permit(:name)
	end
end
