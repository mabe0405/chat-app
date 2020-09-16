require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context "正常確認" do
     it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
     end

     it "passwordが6文字以上であれば登録できること" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
     end

    end

    context "異常確認" do

     it "nameが空では登録できないこと" do
      @user.name =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
     end

     it "emailが空では登録できないこと" do
      @user.email =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "passwordが空では登録できないこと" do
      @user.password =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     
     it "passwordが5文字以下であれば登録できないこと" do
       @user.password = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
     end

     it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      binding.pry
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
    end
  end
 end
