require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it "全項目が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が含まれていない場合登録できない" do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが全角では登録できない" do
        @user.password = 'ａａａａａａ'
        @user.password_confirmation = 'ａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）を入力してください", "苗字（全角）は不正な値です")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）を入力してください", "名前（全角）は不正な値です")
      end
      it "last_nameが半角文字だと登録できない" do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（全角）は不正な値です")
      end
      it "first_nameが半角文字だと登録できない" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（全角）は不正な値です")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ（全角）を入力してください", "苗字カナ（全角）は不正な値です")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ（全角）を入力してください", "名前カナ（全角）は不正な値です")
      end
      it "last_name_kanaがカタカナでないと登録できない" do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ（全角）は不正な値です")
      end
      it "first_name_kanaがカタカナでないと登録できない" do
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ（全角）は不正な値です")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
