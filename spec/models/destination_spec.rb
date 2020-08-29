require 'rails_helper'

RSpec.describe Destination, type: :model do
  before do
    @destination = FactoryBot.build(:destination)
  end

  describe '配送先登録' do
    context '配送先登録がうまくいく時' do
      it 'postal_code,prefecture_id,city,house_number,phone_numberが存在すれば登録できる' do
        expect(@destination).to be_valid
      end
      it 'postal_codeが7桁のハイフンを含んだ数字であれば登録できる' do
        @destination.postal_code = "789-1234"
        expect(@destination).to be_valid
      end
      it 'phone_numberが11桁のハイフンを含まない数字であれば登録できる' do
        @destination.phone_number = "78912345678"
        expect(@destination).to be_valid
      end
    end
    context '配送先登録がうまくいかない時' do
      it 'postal_codeが空だと登録できない' do
        @destination.postal_code = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeがハイフンを含んでいないと登録できない' do
        @destination.postal_code = "1234567"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが7桁でないと登録できない' do
        @destination.postal_code = "123-456"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0だと出品できない' do
        @destination.prefecture_id = 0
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @destination.city = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @destination.house_number = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @destination.phone_number = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含んでいると登録できない' do
        @destination.phone_number = "090-1234-5678"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid. Include not hyphen(-)")
      end
      it 'phone_numberが11桁でないと登録できない' do
        @destination.phone_number = "0901234567"
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid. Include not hyphen(-)")
      end
    end
  end
end
