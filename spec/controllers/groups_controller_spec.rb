require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  #GroupsControllerのテストは書かなくていいっぽい
  describe 'GET #index' do
    it "render the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
