class MessagesController < ApplicationController

	# before_action :set_group

	def index
		@groups = Group.all
		@group = Group.find(params[:group_id])
	end
	def create
		redirect_to aciton: :index
	end

	# def set_group
	# 	@group = Group.find(params[:group_id])
	# end

end
