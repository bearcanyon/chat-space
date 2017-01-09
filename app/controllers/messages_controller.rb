class MessagesController < ApplicationController

  before_action :authenticate_user!#ログインしていないときログインページに飛ばす

	def index
		@groups = Group.all
		@group = Group.find(params[:group_id])
    @messages = @group.messages.order("created_at ASC")
    @message = Message.new
	end

	def create
    @group = Group.find(params[:group_id])
    @message = current_user.messages.new(message_params)
    if @message.save

      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json { render json:
                    {  body: @message.body,
                       created_at: @message.created_at,
                       name: @message.user.name }}
      end

      flash[:notice] = "メッセージ送信完了"
    else
      flash[:alert] = "メッセージ送信失敗"
      redirect_to root_path
    end
	end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end


