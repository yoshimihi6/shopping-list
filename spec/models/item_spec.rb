require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品が投稿できる場合' do
      it 'item_nameとimageとpriceが存在していれば保存できる' do
        expect(@item).to be_valid
      end
      it 'item_nameが空でも保存できる' do
        @item.item_name = ''
        expect(@item).to be_valid
      end
      it 'imageが空でも保存できる' do
        @item.image = nil
        expect(@item).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'item_nameとimageが空では保存できない' do
        @item.item_name = ''
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が半角数字以外では登録できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'storeが紐付いていないと保存できない' do
        @item.store = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Store must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end


end
