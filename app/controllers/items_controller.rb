class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :damedayo_edit, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :item_condition_id, :payer_id, :prefectures_id,
                                 :waiting_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def damedayo_edit
    @item = Item.find(params[:id])
    @user = @item.user
    redirect_to(root_path) unless @user == current_user
  end
end
