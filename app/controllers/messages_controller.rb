class MessagesController < ApplicationController
	def index
	end
	def create
		redirect_to aciton: :index
	end
end
