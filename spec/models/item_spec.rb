require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it 'image,name,text,price,category_id,state_id,delivery_type_id,prefecture_id,duration_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが0だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end
      it 'state_idが0だと出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('State を入力してください')
      end
      it 'delivery_type_idが0だと出品できない' do
        @item.delivery_type_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery type を入力してください')
      end
      it 'prefecture_idが0だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を入力してください')
      end
      it 'duration_idが0だと出品できない' do
        @item.duration_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Duration を入力してください')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は適正な価格にしてください')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は適正な価格にしてください')
      end
      it 'priceが299以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は適正な価格にしてください')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は適正な価格にしてください')
      end
    end
  end
end
