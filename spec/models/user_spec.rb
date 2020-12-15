require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemailとpasswordとencrypted_passwordとfamilynameとfirst_nameとfamily_name_kanaとfirst_nama_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードは、６文字以上かつ半角英数字混合での入力が必須であること' do
        @user.password = 'momo000000'
        @user.password_confirmation = 'momo000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含めないと登録できない' do
        @user.email = 'momo.momo.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは、空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、５文字以下では登録できない' do
        @user.password = 'momo0'
        @user.password_confirmation = 'momo0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもencrypted_passwordが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力じゃなければ登録できない' do
        @user.family_name = '000000'
        @user.first_name = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力じゃなければ登録できない' do
        @user.family_name_kana = '000000'
        @user.first_name_kana = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid', 'First name kana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
