require 'rails_helper'
RSpec.describe Message, :type => :model do
  describe Message do
    describe '#create' do

      it "バリデーションに引っかかり保存できない場合" do
        message = build(:empty_message)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください。")
      end

      it "バリデーションに引っかからず保存できる場合" do
        message = build(:message)
        message.valid?
        expect(message).to be_valid
      end
    end
  end
end
#
