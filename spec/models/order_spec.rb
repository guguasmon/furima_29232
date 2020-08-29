require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'オーダー登録' do
    context '登録がうまくいくとき' do
      it 'tokenが存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context '登録がうまくいかない時' do
      it 'tokenが空だと登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
