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

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name ruby can't be blank"
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name ruby can't be blank"
      end

      it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
      end

      it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end

      it 'last_name_rubyは全角カタカナ以外では登録できないこと' do
        @user.last_name_ruby = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name ruby 全角カナを使用してください'
      end

      it 'first_name_rubyは全角カタカナ以外では登録できないこと' do
        @user.first_name_ruby = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name ruby 全角カナを使用してください'
      end

      it 'last_name_rubyは全角カタカナ以外の全角文字では登録できないこと' do
        @user.last_name_ruby = 'さかい'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name ruby 全角カナを使用してください'
      end

      it 'first_name_rubyは全角カタカナ以外では登録できないこと' do
        @user.first_name_ruby = 'たかおみ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name ruby 全角カナを使用してください'
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailは＠を含まなければ登録できないこと' do
        @user.email = 'taka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
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

      it 'password_confirmationがなければ登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
