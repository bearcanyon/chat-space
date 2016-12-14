require 'rails_helper'
RSpec.describe MessagesController, type: :controller do
  describe 'GET #index' do
    it "render the :index template" do
      get :index, group_id: 1
      expect(response).to render_template :index
    end
  end
end
# コントローラーのテストでは主に
# 「アクション内で定義するインスタンス変数の値が期待したものになるか」
# 「アクションが呼ばれたあと、期待したビューが表示されるか」の2点を確かめます。
