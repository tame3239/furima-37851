require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品を出品できるとき' do
      it 'nameとexplanation、category_idとitem_condition_id、payer_idとprefectures_id、waiting_days_idとprice、imageが条件を満たした上で存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない時' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態情報が空では出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担情報が空では出品できない' do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer can't be blank")
      end
      it '発送元の地域情報が空では出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送までの日数情報が空では出品できない' do
        @item.waiting_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Waiting days can't be blank")
      end
      it '出品価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '出品価格が300円以上でなければ出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '出品価格が9,999,999円以下でなければ出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '出品価格は半角数値でなければ出品できない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
