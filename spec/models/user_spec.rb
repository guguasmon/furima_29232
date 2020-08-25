require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'name,email,password,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが@を含んでいれば登録できる' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'def456'
        @user.password_confirmation = 'def456'
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'カタカナ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'カタカナ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが@を含んでいないと登録できない' do
        @user.email = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したEmailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下の英数字では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合ではない場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name full-width characters.')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full-width characters.')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name full-width characters.')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name full-width characters.')
      end
      it 'First_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana full-width katakana characters.')
      end
      it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana full-width katakana characters.')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana full-width katakana characters.')
      end
      it 'last_name_kanaが全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana full-width katakana characters.')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
