require 'rails_helper'
describe UserBuy do
  before do
    @user_buy = FactoryBot.build(:user_buy)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it "postal_codeとprefectureとcityとhouse_numberとphone_numberとuser_idとitem_idが存在すれば保存できる" do
        expect(@user_buy).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @user_buy.building = nil
        expect(@user_buy).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it 'postal_codeが空だと保存できない' do
        @user_buy.postal_code = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_buy.postal_code = "1111111"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと保存できない' do
        @user_buy.prefecture_id = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの情報が1が選択されていたら保存できない' do
        @user_buy.prefecture_id = "1"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できない' do
        @user_buy.city = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @user_buy.house_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @user_buy.phone_number = nil
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number can't be blank" )
      end
      it 'phone_numberが半角数字でないと保存できない' do
        @user_buy.phone_number = "１２３４５６７８９１２"
        @user_buy.valid?
        expect(@user_buy.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end