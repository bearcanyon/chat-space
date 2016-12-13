class MessagesController < ApplicationController

	def index
		@groups = Group.all
		@group = Group.find(params[:group_id])
    @messages = @group.messages
    @message = Message.new
	end

	def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージ送信完了"
    else
      flash[:alert] = "メッセージ送信失敗"
    end
    redirect_to group_messages_path
	end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end
