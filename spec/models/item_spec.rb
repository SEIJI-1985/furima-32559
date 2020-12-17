require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it 'imageとtitleとpriceとcategory_idとcondition_idとshipping_idとsend_out_idとcommunity_idとexplanationが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーの情報が1が選択されていたら登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態についての情報が1が選択されていたら登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担についての情報が空では登録できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '配送料の負担についての情報が1が選択されていたら登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it '発送元の地域についての情報が空では登録できない' do
        @item.community_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Community can't be blank")
      end
      it '発送元の地域についての情報が1が選択されていたら登録できない' do
        @item.community_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Community must be other than 1")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @item.send_out_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send out can't be blank")
      end
      it '発送までの日数についての情報が1が選択されていたら登録できない' do
        @item.send_out_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Send out must be other than 1")
      end
      it '価格についての情報が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が¥10,000,000円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '販売価格は半角数字でなければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英数混合では登録できない' do
        @item.price = 'aaaaaa111111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英語では登録できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
