require 'rails_helper'

RSpec.describe UserShopping, type: :model do
  before do
    @shopping = FactoryBot.build(:user_shopping)
  end

  describe '商品購入登録' do
    context '商品購入登録がうまくいく時' do
      it 'postal_code,prefecture_id,city,house_number,phone_number,tokenが存在すれば登録できる' do
        expect(@shopping).to be_valid
      end
      it 'postal_codeが7桁のハイフンを含んだ数字であれば登録できる' do
        @shopping.postal_code = '789-1234'
        expect(@shopping).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @shopping.building_name = nil
        expect(@shopping).to be_valid
      end
      it 'phone_numberが11桁のハイフンを含まない数字であれば登録できる' do
        @shopping.phone_number = '78912345678'
        expect(@shopping).to be_valid
      end
    end
    context '商品購入登録がうまくいかない時' do
      it 'postal_codeが空だと登録できない' do
        @shopping.postal_code = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Postal code can't be blank", "Postal code はハイフン（-）を入れた７桁で入力してください")
      end
      it 'postal_codeがハイフンを含んでいないと登録できない' do
        @shopping.postal_code = '1234567'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Postal code はハイフン（-）を入れた７桁で入力してください")
      end
      it 'postal_codeが7桁でないと登録できない' do
        @shopping.postal_code = '123-456'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include('Postal code はハイフン（-）を入れた７桁で入力してください')
      end
      it 'prefecture_idが0だと出品できない' do
        @shopping.prefecture_id = 0
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Prefecture の選択肢を選んでください")
      end
      it 'cityが空だと登録できない' do
        @shopping.city = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @shopping.house_number = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @shopping.phone_number = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含んでいると登録できない' do
        @shopping.phone_number = '090-1234-5678'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include('Phone number はハイフン（-）を入れた１１桁で入力してください')
      end
      it 'phone_numberが11桁でないと登録できない' do
        @shopping.phone_number = '0901234567'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include('Phone number はハイフン（-）を入れた１１桁で入力してください')
      end
      it 'tokenが空だと登録できない' do
        @shopping.token = nil
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
