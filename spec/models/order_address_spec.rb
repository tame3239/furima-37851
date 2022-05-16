require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品を購入する' do
    context '商品を購入できるとき' do
      it '全てのフォームが条件を満たした上で入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できない時' do
      it '郵便番号が空では出品できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでなければ保存できない' do
        @order_address.post_code = '123ー4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を含めて入力してください')
      end
      it '都道府県が空では購入できない' do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は、半角数値のみでなければ保存できない' do
        @order_address.telephone_number = '090-1234-56'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁〜11桁の半角数字で入力してください')
      end
      it '電話番号は、10桁以上でなければ保存できない' do
        @order_address.telephone_number = '09012345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁〜11桁の半角数字で入力してください')
      end
      it '電話番号は、11桁以内でなければ保存できない' do
        @order_address.telephone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁〜11桁の半角数字で入力してください')
      end
      it 'クレジットカード情報が空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
