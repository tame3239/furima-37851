require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てのフォームが条件を満たした上で存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'abcxyz'
        @user.password_confirmation = 'abcxyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordは全角文字を含むパスワードでは登録できない' do
        @user.password = '１23ａbc'
        @user.password_confirmation = '１23ａbc'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameは全角で入力しないと登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を全角で入力してください')
      end
      it 'first_nameは全角で入力しないと登録できない' do
        @user.first_name = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を全角で入力してください')
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'last_name_katakanaはカタカナで入力しないと登録できない' do
        @user.last_name_katakana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナを全角で入力してください')
      end
      it 'first_name_katakanaはカタカナで入力しないと登録できない' do
        @user.first_name_katakana = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを全角で入力してください')
      end
      it 'last_name_katakanaは全角で入力しないと登録できない' do
        @user.last_name_katakana = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナを全角で入力してください')
      end
      it 'first_name_katakanaは全角で入力しないと登録できない' do
        @user.first_name_katakana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを全角で入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
