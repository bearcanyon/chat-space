class MessagesController < ApplicationController

	def index
		@groups = Group.all
		@group = Group.find(params[:group_id])
	end

	def create
		redirect_to aciton: :index
	end

end
