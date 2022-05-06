require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_katakanaとfirst_name_katakana、birthdayが条件を満たした上で存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合で入力しないと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "a123456"
        @user.password_confirmation = 'a123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameは全角で入力しないと登録できない' do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters")
      end
      it 'first_nameは全角で入力しないと登録できない' do
        @user.first_name = "ﾘｸﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters")
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'first_name_katakanaが空では登録できない' do
          @user.first_name_katakana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'last_name_katakanaはカタカナで入力しないと登録できない' do
        @user.last_name_katakana = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana Input full-width katakana characters")
      end
      it 'first_name_katakanaはカタカナで入力しないと登録できない' do
        @user.first_name_katakana = "陸太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana Input full-width katakana characters")
      end
      it 'last_name_katakanaは全角で入力しないと登録できない' do
        @user.last_name_katakana = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana Input full-width katakana characters")
      end
      it 'first_name_katakanaは全角で入力しないと登録できない' do
        @user.first_name_katakana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana Input full-width katakana characters")
      end
      it 'birthdayが空では登録できない'do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end
end