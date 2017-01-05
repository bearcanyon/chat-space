class MessagesController < ApplicationController

  before_action :authenticate_user!#ログインしていないときログインページに飛ばす

	def index
		@groups = Group.all
		@group = Group.find(params[:group_id])
    @messages = @group.messages.order("created_at ASC")
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
	end

	def create
    @message = current_user.messages.new(message_params)
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


