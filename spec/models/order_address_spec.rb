require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address)
  end

  context '商品が購入できる時' do
    it '全ての値が正しく入力されている時' do
      
    end
    it '建物名が無い場合でも保存できる' do
      
    end
  end

  context '商品が購入できない時' do
    it '紐づくuserがいないと購入できない' do
      
    end
    it '紐づく商品情報がないと購入できない' do
      
    end
    it 'token(クレジットカード情報)が無いと購入できない' do
      
    end
    it '郵便番号が空だと購入できない' do
      
    end
    it '郵便番号にハイフンが含まれないと購入できない' do
      
    end
    it '都道府県を選択しないと購入できない' do
      
    end
    it '市町村を入力しないと購入できない' do
      
    end
    it '電話番号が空だと購入できない' do
      
    end
    it '電話番号に数値以外が入力されていると購入できない' do
      
    end
    it '電話番号に英字が入力されていると購入できない' do
      
    end
    it '電話番号が11桁以上だと購入できない' do
      
    end
  end
end