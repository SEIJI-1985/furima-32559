class DestinationsController < ApplicationController
   def index
      @item = Item.find(params[:item_id])
      @user_buy = UserBuy.new
   end

   def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(user_buy_params)
    if @user_buy.valid?
        @user_buy.save
        redirect_to root_path
    else
        render action: :index
    end
   end

   private

   def user_buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id).merge(item_id: current_user.id)
   end
end