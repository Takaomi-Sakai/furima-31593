require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '保存できる場合' do
    it 'nicknameとemail、passwordとpassword_confirmation last_name, first_name, last_name_ruby, first_name_ruby, birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    
    it 'passwordとpassword_confirmationが6文字以上、半角英数字混合、パスワードとパスワード（確認用）、値の一致であれば登録できる' do
      @user.password = 'Aa1234'
      @user.password_confirmation = 'Aa1234'
      expect(@user).to be_valid
    end

    it 'ユーザー本名は全角（漢字）であれば登録できる' do
      @user.last_name = '酒井'
      @user.first_name = '隆臣'
      expect(@user).to be_valid
    end

    it 'ユーザー本名は全角（ひらがな）であれば登録できる' do
      @user.last_name = 'さかい'
      @user.first_name = 'たかおみ'
      expect(@user).to be_valid
    end

    it 'ユーザー本名は全角（カタカナ）であれば登録できる' do
      @user.last_name = 'サカイ'
      @user.first_name = 'タカオミ'
      expect(@user).to be_valid
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）であれば登録できる' do
      @user.last_name_ruby = 'カタカナ'
      @user.first_name_ruby = 'カタカナ'
      expect(@user).to be_valid
    end
  end

  context '保存できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字だけでは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordが文字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
 end
end