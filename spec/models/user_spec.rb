require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'nickname,email,password,password_confirmation,last_namej,first_namej,last_namek,first_namek,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上の英数字混合であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emaiが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemaiが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは＠を含まなければ登録できない' do
        @user.email = 'testtarou.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'last_namejが空では登録できない' do
        @user.last_namej = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last namej can't be blank")
      end
      it 'last_namejが半角では登録できない' do
        @user.last_namej = 'saitou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last namej is invalid")
      end
      it 'first_namejが空では登録できない' do
        @user.first_namej = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First namej can't be blank")
      end
      it 'first_namejが半角では登録できない' do
        @user.first_namej = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First namej is invalid")
      end
      it 'last_namekが空では登録できない' do
        @user.last_namek = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last namek can't be blank")
      end
      it 'last_namekが半角カタカナでは登録できない' do
        @user.last_namek = 'ｻｲﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last namek is invalid")
      end
      it 'first_namekが空では登録できない' do
        @user.first_namek = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First namek can't be blank")
      end
      it 'first_namekが半角カタカナでは登録できない' do
        @user.first_namek = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First namek is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
