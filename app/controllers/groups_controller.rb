class GroupsController < ApplicationController
	before_action :find_group, only: [:edit, :update]

	def index
		@groups = Group.all
	end
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

	def edit
	end

	def update
		@group.update(create_params)
		redirect_to :root
	end

	def create_params
		params.require(:group).permit(:name, user_ids: [])
	end
	def find_group
		@group = Group.find(params[:id])
	end
end
