require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗作成' do
    context '新規作成できる場合' do
      it "store_nameの値が存在すれば作成できる" do
        expect(@store).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "store_nameが空では作成できない" do
        @store.store_name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Store name can't be blank")
      end
    end
  end
end
