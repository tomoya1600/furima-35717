require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '商品が購入できる時' do
    it '全ての値が正しく入力されている時' do
      expect(@order_address).to be_valid
    end
    it '建物名が無い場合でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '商品が購入できない時' do
    it '紐づくuserがいないと購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it '紐づく商品情報がないと購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'token(クレジットカード情報)が無いと購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end
    it '郵便番号にハイフンが含まれないと購入できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択しないと購入できない' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村を入力しないと購入できない' do
      @order_address.city_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City name can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号に数値以外が入力されていると購入できない' do
      @order_address.phone_number = '080-5555-2222'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号に英字が入力されていると購入できない' do
      @order_address.phone_number = 'tel08055552'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が9桁以下だと購入できない' do
      @order_address.phone_number = '08055552'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_address.phone_number = '080555522223'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end