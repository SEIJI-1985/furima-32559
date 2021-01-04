class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :move_to_index, except: [:show]
  before_action :sold_to_index, except: [:show]
  before_action :set_item, only: [:index, :create]

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(user_buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && @item.history.present?
  end

  def sold_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
