require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it "全項目が正しく入力されていれば登録できる" do
        
      end
    end

    context '新規登録ができないとき' do
      it "nicknameが空だと登録できない" do
        
      end
      it "emailが空だと登録できない" do
        
      end
      it "emailに@が含まれていないと登録できない" do
        
      end
      it "重複したemailが存在する場合登録できない" do
        
      end
      it "passwordが空だと登録できない" do
        
      end
      it "passwordが5文字以下だと登録できない" do
        
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        
      end
      it "last_nameが空だと登録できない" do
        
      end
      it "first_nameが空だと登録できない" do
        
      end
      it "last_nameとfirst_nameが半角文字だと登録できない" do
        
      end
      it "last_name_kanaが空だと登録できない" do
        
      end
      it "first_name_kanaが空だと登録できない" do
        
      end
      it "last_name_kanaとfirst_name_kanaがカタカナだと登録できない" do
        
      end
      it "birthdayが空だと登録できない" do
        
      end
    end
  end
end
