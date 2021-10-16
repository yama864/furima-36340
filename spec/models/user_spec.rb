require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが無いと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが無いと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid?
      expect(other_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含むまないと登録できない' do
      @user.email = 'aaaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが無いと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力がないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードは、半角英数字混合での入力がないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '苗字の入力が無いと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名前の入力が無いと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '苗字が全角でないと登録できない' do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前が全角でないと登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '苗字（カナ）の入力が無いと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '名前（カナ）の入力が無いと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '苗字（カナ）が全角カタカナでないと登録できない' do
      @user.last_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '名前（カナ）が全角カタカナでないと登録できない' do
      @user.first_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日の入力が無いと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
