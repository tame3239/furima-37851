class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :damedayo_edit, :destroy]
  before_action :damedayo_edit, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]

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
    @comments = @item.comments.includes(:user).order("created_at DESC")
    @comment = Comment.new
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :item_condition_id, :payer_id, :prefectures_id,
                                 :waiting_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def damedayo_edit
    redirect_to(root_path) unless @item.user.id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
