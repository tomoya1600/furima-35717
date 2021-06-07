require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての値が存在すれば登録できる' do
        
      end
    end
    context '商品出品ができない時' do
      it 'titleが空では出品できない' do
        
      end
      it 'textが空では出品できない' do
        
      end
      it 'category_idが空では出品できない' do
        
      end
      it 'category_idに1が選択されている場合は出品できない' do
        
      end
      it 'status_idが空では出品できない' do
        
      end
      it 'status_idに1が選択されている場合は出品できない' do
        
      end
      it 'shipping_fee_idが空では出品できない' do
        
      end
      it 'shipping_fee_idに1が選択されている場合は出品できない' do
        
      end
      it 'prefecture_idが空では出品できない' do
        
      end
      it 'prefecture_idに1が選択されている場合は出品できない' do
        
      end
      it 'scheduled_idが空では出品できない' do
        
      end
      it 'scheduled_idに1が選択されている場合は出品できない' do
        
      end
      it 'priceが空では出品できない' do
        
      end
      it 'priceが全角数字では出品できない' do
        
      end
      it 'priceが1000000以上では出品できない' do
        
      end
      it 'priceが299以下では出品できない' do
        
      end
      it 'priceが英数字混合では出品できない' do
        
      end
      it 'priceが半角英字のみでは出品できない' do
        
      end
      it 'priceが全角英字では出品できない' do
        
      end
      it 'imageが空では出品できない' do
        
      end
    end
  end
end