require 'rails_helper'
RSpec.describe MessagesController, type: :controller do

  let(:group) {create(:group)}
  let(:message) {{message: attributes_for(:message), group_id: group.id}}
  let(:empty_message) {{message: attributes_for(:empty_message), group_id: group.id}}
  let(:user) {create(:user)}

  context 'not sign_out user' do
    describe 'GET #index' do
      #サインインしてないユーザーがindexアクションを動かしたらリダイレクトされる
      it 'render the :index template' do
        get :index, group_id: group.id
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'POST #create' do
      it "render the :index template" do
        post :create, message
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'sign_in user' do
    before do
      login_user(user)
    end
    describe 'GET #index' do
      before do
        get :index, group_id: group.id
      end
      #indexアクションでindexが表示されるか
      it "render the :index template" do
        expect(response).to render_template :index
      end

      # indexのインスタンス変数の値が期待したものになるか
      it "assigns the requested contact to @message" do
        expect(assigns(:group)).to eq group
      end
    end

    describe 'POST #create' do
      #createアクションでcreateのviewが表示できるか、redirectでindexのviewを表示できるか
      it "renders the :create template" do
        post :create, message
        expect(response).to redirect_to group_messages_path(group)
      end

      # createのインスタンス変数の値が期待したものになるか
      it "assigns the requested contact to @empty_message" do
        post :create, empty_message
        expect(flash[:alert]).to eq "メッセージ送信失敗"
      end

      it "save success" do
        expect{post :create, message}.to change{Message.count}.by(1)
      end
    end
  end
end

# コントローラーのテストでは主に
# 「アクション内で定義するインスタンス変数の値が期待したものになるか」
# 「アクションが呼ばれたあと、期待したビューが表示されるか」の2点を確かめ
